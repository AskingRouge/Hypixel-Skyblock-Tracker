import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 14) {
            ProgressView()
                .scaleEffect(1.25)
            Text("Loading Bazaar prices...")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    LoadingView()
}
