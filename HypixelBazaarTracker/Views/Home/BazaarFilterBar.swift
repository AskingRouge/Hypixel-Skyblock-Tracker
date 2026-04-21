import SwiftUI

struct BazaarFilterBar: View {
    @Binding var selectedSort: BazaarSortOption
    @Binding var showOnlyProfitable: Bool

    var body: some View {
        VStack(spacing: 10) {
            Picker("Sort", selection: $selectedSort) {
                ForEach(BazaarSortOption.allCases) { option in
                    Text(option.rawValue).tag(option)
                }
            }
            .pickerStyle(.segmented)

            Toggle("Show profitable flips only", isOn: $showOnlyProfitable)
                .font(.subheadline)
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
}

#Preview {
    BazaarFilterBar(selectedSort: .constant(.weeklyVolume), showOnlyProfitable: .constant(false))
}
