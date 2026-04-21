import Foundation

struct BazaarResponse: Codable {
    let success: Bool
    let lastUpdated: Int
    let products: [String: BazaarProduct]
}

struct BazaarProduct: Codable, Identifiable, Hashable {
    let productId: String
    let sellSummary: [BazaarOrder]
    let buySummary: [BazaarOrder]
    let quickStatus: QuickStatus

    var id: String { productId }

    var displayName: String {
        productId
            .replacingOccurrences(of: "_", with: " ")
            .replacingOccurrences(of: ":", with: " ")
            .capitalized
    }

    enum CodingKeys: String, CodingKey {
        case productId = "product_id"
        case sellSummary = "sell_summary"
        case buySummary = "buy_summary"
        case quickStatus = "quick_status"
    }
}

struct BazaarOrder: Codable, Hashable {
    let amount: Int
    let pricePerUnit: Double
    let orders: Int
}

struct QuickStatus: Codable, Hashable {
    let productId: String
    let sellPrice: Double
    let sellVolume: Int
    let sellMovingWeek: Int
    let sellOrders: Int
    let buyPrice: Double
    let buyVolume: Int
    let buyMovingWeek: Int
    let buyOrders: Int
}

enum BazaarSortOption: String, CaseIterable, Identifiable {
    case name = "Name"
    case buyPrice = "Buy Price"
    case sellPrice = "Sell Price"
    case weeklyVolume = "Weekly Volume"

    var id: String { rawValue }
}
