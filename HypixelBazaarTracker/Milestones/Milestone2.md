# Final Project Milestone 2

## Final App Hierarchy

### Bazaar Screen

File: `Views/Home/HomeView.swift`

Displays live Bazaar products from the Hypixel API. It includes search, sorting, and a profit-only toggle.

### Bazaar List Screen

File: `Views/Bazaar/BazaarListView.swift`

Displays filtered Bazaar products using a `List` and a `ForEach`-powered list structure through SwiftUI's identifiable list data.

### Bazaar Row Subview

File: `Views/Bazaar/BazaarItemRowView.swift`

Reusable row/card subview that shows an item's name, buy price, sell price, spread, and favorite state.

### Detail Screen

File: `Views/Detail/BazaarDetailView.swift`

Displays detailed information for one Bazaar item, including price, volume, weekly movement, order count, and product ID.

### Favorites Screen

File: `Views/Favorites/FavoritesView.swift`

Displays saved Bazaar product IDs from the app's shared favorites store and lets users remove items from their watchlist.

## Navigation

The app uses:

- `TabView` for Bazaar and Favorites tabs
- `NavigationStack` for each tab
- `NavigationLink` from Bazaar rows to item details
- `@Binding` to pass favorite state into the detail screen

## Folder Structure

```text
HypixelBazaarTracker/
  Services/
    HypixelService.swift
  Models/
    BazaarModels.swift
  Views/
    Home/
      HomeView.swift
      BazaarFilterBar.swift
    Bazaar/
      BazaarListView.swift
      BazaarItemRowView.swift
    Detail/
      BazaarDetailView.swift
    Favorites/
      FavoritesView.swift
  Shared/
    FavoritesStore.swift
    LoadingView.swift
    EmptyStateView.swift
    PriceMetricView.swift
  ContentView.swift
  HypixelBazaarTrackerApp.swift
```

## Requirements Checklist

- [x] A `ForEach` with reusable subviews
  - `Picker` uses `ForEach(BazaarSortOption.allCases)`
  - `List(products)` displays reusable `BazaarItemRowView`
- [x] A `@State` property
  - `products`, `searchText`, `selectedSort`, `showOnlyProfitable`, `isLoading`, `errorMessage`
- [x] 2+ unique user input components
  - `TextField` behavior through `.searchable`
  - `Picker`
  - `Toggle`
  - `Button`
- [x] A binding
  - `BazaarFilterBar` uses `@Binding`
  - `BazaarDetailView` uses `@Binding var isFavorite`
- [x] Data from an API endpoint
  - Hypixel SkyBlock Bazaar API
- [x] Service class
  - `HypixelService`
- [x] JSON decoding
  - `JSONDecoder`
- [x] Codable structs
  - `BazaarResponse`, `BazaarProduct`, `BazaarOrder`, `QuickStatus`
- [x] README
  - Included in `README.md`

## Obstacles and Future Improvements

Obstacles:

- Hypixel returns products as a dictionary, so the app converts dictionary values into an array for SwiftUI lists.
- Bazaar product IDs are formatted for code, so the app creates cleaner display names.

Future improvements:

- Persist favorites permanently with `AppStorage` or SwiftData
- Add price alerts
- Add charts for price history if another endpoint or saved local history is added
- Add item categories
