import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject private var favoritesStore: FavoritesStore

    var body: some View {
        Group {
            if favoritesStore.productIds.isEmpty {
                EmptyStateView(
                    title: "No Favorites Yet",
                    message: "Open a Bazaar item and tap Add Favorite to start a watchlist.",
                    systemImage: "star"
                )
            } else {
                List {
                    ForEach(Array(favoritesStore.productIds).sorted(), id: \.self) { productId in
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)

                            Text(productId.cleanedProductName)
                                .font(.headline)

                            Spacer()

                            Button {
                                favoritesStore.toggle(productId)
                            } label: {
                                Image(systemName: "minus.circle.fill")
                                    .foregroundStyle(.red)
                            }
                            .buttonStyle(.plain)
                            .accessibilityLabel("Remove \(productId.cleanedProductName)")
                        }
                    }
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Favorites")
    }
}

private extension String {
    var cleanedProductName: String {
        replacingOccurrences(of: "_", with: " ")
            .replacingOccurrences(of: ":", with: " ")
            .capitalized
    }
}

#Preview {
    NavigationStack {
        FavoritesView()
    }
    .environmentObject(FavoritesStore())
}
