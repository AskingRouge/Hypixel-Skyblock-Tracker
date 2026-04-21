import SwiftUI

struct BazaarItemRowView: View {
    let product: BazaarProduct
    let isFavorite: Bool

    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.cyan.opacity(0.16))

                Image(systemName: "cube.box.fill")
                    .foregroundStyle(.cyan)
            }
            .frame(width: 44, height: 44)

            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(product.displayName)
                        .font(.headline)
                        .lineLimit(1)

                    if isFavorite {
                        Image(systemName: "star.fill")
                            .font(.caption)
                            .foregroundStyle(.yellow)
                    }
                }

                Text("Buy \(product.quickStatus.buyPrice.formattedPrice) • Sell \(product.quickStatus.sellPrice.formattedPrice)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 4) {
                Text(product.spread.formattedPrice)
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(product.spread >= 0 ? .green : .red)

                Text("spread")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 6)
    }
}

private extension BazaarProduct {
    var spread: Double {
        quickStatus.sellPrice - quickStatus.buyPrice
    }
}

private extension Double {
    var formattedPrice: String {
        formatted(.number.precision(.fractionLength(0...1)))
    }
}
