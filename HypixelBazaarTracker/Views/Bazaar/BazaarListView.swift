import SwiftUI

struct BazaarListView: View {
    @EnvironmentObject private var favoritesStore: FavoritesStore

    let products: [BazaarProduct]

    var body: some View {
        if products.isEmpty {
            EmptyStateView(
                title: "No Bazaar Items",
                message: "Try another search or turn off the profit filter.",
                systemImage: "shippingbox"
            )
        } else {
            List {
                ForEach(products) { product in
                    NavigationLink {
                        BazaarDetailView(
                            product: product,
                            isFavorite: favoritesStore.binding(for: product.id)
                        )
                    } label: {
                        BazaarItemRowView(
                            product: product,
                            isFavorite: favoritesStore.contains(product.id)
                        )
                    }
                }
            }
            .listStyle(.plain)
        }
    }
}
