import SwiftUI
import Combine

final class FavoritesStore: ObservableObject {
    @Published private(set) var productIds: Set<String> = []

    func contains(_ productId: String) -> Bool {
        productIds.contains(productId)
    }

    func toggle(_ productId: String) {
        if productIds.contains(productId) {
            productIds.remove(productId)
        } else {
            productIds.insert(productId)
        }
    }

    func binding(for productId: String) -> Binding<Bool> {
        Binding {
            self.contains(productId)
        } set: { isFavorite in
            if isFavorite {
                self.productIds.insert(productId)
            } else {
                self.productIds.remove(productId)
            }
        }
    }
}
