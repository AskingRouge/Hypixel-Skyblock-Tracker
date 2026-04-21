import SwiftUI

struct BazaarDetailView: View {
    let product: BazaarProduct
    @Binding var isFavorite: Bool

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                header

                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                    PriceMetricView(title: "Buy Price", value: product.quickStatus.buyPrice.formattedPrice, systemImage: "cart.fill", tint: .green)
                    PriceMetricView(title: "Sell Price", value: product.quickStatus.sellPrice.formattedPrice, systemImage: "tag.fill", tint: .blue)
                    PriceMetricView(title: "Buy Volume", value: product.quickStatus.buyVolume.formatted(), systemImage: "arrow.down.circle.fill", tint: .orange)
                    PriceMetricView(title: "Sell Volume", value: product.quickStatus.sellVolume.formatted(), systemImage: "arrow.up.circle.fill", tint: .purple)
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text("Market Snapshot")
                        .font(.title3.weight(.semibold))

                    DetailLineView(label: "Weekly buy movement", value: product.quickStatus.buyMovingWeek.formatted())
                    DetailLineView(label: "Weekly sell movement", value: product.quickStatus.sellMovingWeek.formatted())
                    DetailLineView(label: "Buy orders", value: product.quickStatus.buyOrders.formatted())
                    DetailLineView(label: "Sell orders", value: product.quickStatus.sellOrders.formatted())
                    DetailLineView(label: "Product ID", value: product.productId)
                }
                .padding()
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .padding()
        }
        .navigationTitle(product.displayName)
        .navigationBarTitleDisplayMode(.inline)
    }

    private var header: some View {
        HStack(alignment: .top, spacing: 14) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.cyan.opacity(0.18))

                Image(systemName: "cube.box.fill")
                    .font(.largeTitle)
                    .foregroundStyle(.cyan)
            }
            .frame(width: 76, height: 76)

            VStack(alignment: .leading, spacing: 8) {
                Text(product.displayName)
                    .font(.title2.weight(.bold))

                Text("Live Hypixel SkyBlock Bazaar item")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                Button {
                    isFavorite.toggle()
                } label: {
                    Label(isFavorite ? "Favorited" : "Add Favorite", systemImage: isFavorite ? "star.fill" : "star")
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

private struct DetailLineView: View {
    let label: String
    let value: String

    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text(label)
                .foregroundStyle(.secondary)
            Spacer()
            Text(value)
                .fontWeight(.semibold)
                .multilineTextAlignment(.trailing)
        }
        .font(.subheadline)
    }
}

private extension Double {
    var formattedPrice: String {
        formatted(.number.precision(.fractionLength(0...1)))
    }
}
