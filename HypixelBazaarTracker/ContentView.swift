import SwiftUI

struct ContentView: View {
    @StateObject private var favoritesStore = FavoritesStore()

    var body: some View {
        TabView {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Label("Bazaar", systemImage: "chart.line.uptrend.xyaxis")
            }

            NavigationStack {
                FavoritesView()
            }
            .tabItem {
                Label("Favorites", systemImage: "star.fill")
            }
        }
        .environmentObject(favoritesStore)
    }
}

#Preview {
    ContentView()
}
