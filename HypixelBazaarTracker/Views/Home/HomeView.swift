import SwiftUI

struct HomeView: View {
    @State private var products: [BazaarProduct] = []
    @State private var searchText = ""
    @State private var selectedSort: BazaarSortOption = .weeklyVolume
    @State private var showOnlyProfitable = false
    @State private var isLoading = false
    @State private var errorMessage: String?

    private var filteredProducts: [BazaarProduct] {
        var visibleProducts = products

        if !searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            visibleProducts = visibleProducts.filter {
                $0.displayName.localizedCaseInsensitiveContains(searchText)
                || $0.productId.localizedCaseInsensitiveContains(searchText)
            }
        }

        if showOnlyProfitable {
            visibleProducts = visibleProducts.filter {
                $0.quickStatus.sellPrice > $0.quickStatus.buyPrice
            }
        }

        let sortedProducts: [BazaarProduct]

        switch selectedSort {
        case .name:
            sortedProducts = visibleProducts.sorted { $0.displayName < $1.displayName }
        case .buyPrice:
            sortedProducts = visibleProducts.sorted { $0.quickStatus.buyPrice > $1.quickStatus.buyPrice }
        case .sellPrice:
            sortedProducts = visibleProducts.sorted { $0.quickStatus.sellPrice > $1.quickStatus.sellPrice }
        case .weeklyVolume:
            sortedProducts = visibleProducts.sorted {
                ($0.quickStatus.buyMovingWeek + $0.quickStatus.sellMovingWeek) >
                ($1.quickStatus.buyMovingWeek + $1.quickStatus.sellMovingWeek)
            }
        }

        return Array(sortedProducts.prefix(100))
    }

    var body: some View {
        Group {
            if isLoading {
                LoadingView()
            } else if let errorMessage {
                EmptyStateView(title: "Could Not Load Bazaar", message: errorMessage, systemImage: "wifi.exclamationmark")
            } else {
                BazaarListView(
                    products: filteredProducts
                )
            }
        }
        .navigationTitle("SkyBlock Bazaar")
        .searchable(text: $searchText, prompt: "Search items")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    Task {
                        await loadProducts()
                    }
                } label: {
                    Image(systemName: "arrow.clockwise")
                }
                .accessibilityLabel("Refresh Bazaar")
            }
        }
        .safeAreaInset(edge: .top) {
            BazaarFilterBar(
                selectedSort: $selectedSort,
                showOnlyProfitable: $showOnlyProfitable
            )
            .background(.bar)
        }
        .task {
            if products.isEmpty {
                await loadProducts()
            }
        }
    }

    private func loadProducts() async {
        isLoading = true
        errorMessage = nil

        do {
            products = try await HypixelService.shared.getSkyBlockBazaarProducts()
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
    .environmentObject(FavoritesStore())
}
