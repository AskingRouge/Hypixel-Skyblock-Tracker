import Foundation

enum HypixelServiceError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case requestFailed(statusCode: Int)
    case decodingFailed

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The Hypixel URL could not be created."
        case .invalidResponse:
            return "The server returned an invalid response."
        case .requestFailed(let statusCode):
            return "The request failed with status code \(statusCode)."
        case .decodingFailed:
            return "The Bazaar data could not be decoded."
        }
    }
}

final class HypixelService {
    static let shared = HypixelService()

    private let baseURL = URL(string: "https://api.hypixel.net/v2")
    private let urlSession: URLSession
    private let decoder: JSONDecoder

    init(urlSession: URLSession = .shared, decoder: JSONDecoder = JSONDecoder()) {
        self.urlSession = urlSession
        self.decoder = decoder
    }

    func getSkyBlockBazaarProducts() async throws -> [BazaarProduct] {
        guard let url = baseURL?.appendingPathComponent("skyblock/bazaar") else {
            throw HypixelServiceError.invalidURL
        }

        do {
            let (data, response) = try await urlSession.data(from: url)
            try validate(response)
            let decodedResponse = try decoder.decode(BazaarResponse.self, from: data)
            return Array(decodedResponse.products.values).prefix(300).map { $0 }
        } catch let error as HypixelServiceError {
            throw error
        } catch is DecodingError {
            throw HypixelServiceError.decodingFailed
        } catch {
            throw error
        }
    }

    private func validate(_ response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw HypixelServiceError.invalidResponse
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            throw HypixelServiceError.requestFailed(statusCode: httpResponse.statusCode)
        }
    }
}
