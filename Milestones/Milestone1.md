# Final Project Milestone 1

## App Idea

**Hypixel Bazaar Tracker** is a SwiftUI app that displays live Hypixel SkyBlock Bazaar market data. Users can browse items, search for a specific product, sort by different market values, and open a detail screen for deeper price and volume information.

## Service

The app uses a dedicated networking class:

- `Services/HypixelService.swift`
- Main request function: `getSkyBlockBazaarProducts()`
- Endpoint: `https://api.hypixel.net/v2/skyblock/bazaar`

All networking logic is kept inside the service:

- URL creation
- `URLSession` request
- HTTP response validation
- JSON decoding
- error handling with `do-catch`

## Models

The app uses Codable structs in `Models/BazaarModels.swift`:

- `BazaarResponse`
- `BazaarProduct`
- `BazaarOrder`
- `QuickStatus`
- `BazaarSortOption`

These structs decode and represent the API data from Hypixel.

## Initial UI

The starter UI includes:

- `HomeView`
- `BazaarListView`
- `BazaarItemRowView`
- `BazaarDetailView`
- `LoadingView`
- `EmptyStateView`

The initial layout uses:

- `NavigationStack`
- `TabView`
- `List`
- `ScrollView`
- `VStack`
- `LazyVGrid`

## App Hierarchy Draft

- Bazaar tab
  - Home/list screen
  - Detail screen through `NavigationLink`
- Favorites tab
  - Placeholder favorites/watchlist screen

## Milestone 1 Status

- Service class created
- Codable models created
- Basic app hierarchy created
- Initial SwiftUI screens created
- Reusable row/card views created
- API connection started

