# Hypixel Bazaar Tracker

## Purpose

Hypixel Bazaar Tracker is an iOS SwiftUI app that shows live Hypixel SkyBlock Bazaar market data. Users can search Bazaar items, sort them by price or weekly volume, filter for profitable flips, and open a detail page for each item.

## API and Tools Used

- SwiftUI
- `URLSession`
- `async/await`
- `Codable`
- Hypixel SkyBlock Bazaar API: `https://api.hypixel.net/v2/skyblock/bazaar`

## Features Implemented

- Live Bazaar data from the Hypixel API
- Search for Bazaar products
- Sort by name, buy price, sell price, or weekly volume
- Toggle to show profitable flips only
- Detail screen for each product
- Favorites/watchlist tab
- Reusable row and metric card subviews
- Loading and error states
- Favorites interaction using bindings
- Organized folder-per-flow structure

## App Screens

- Bazaar list screen
- Bazaar item detail screen
- Favorites/watchlist screen

## Requirement Checklist

- [x] `ForEach` with reusable subviews
- [x] `@State` property
- [x] 2+ unique input components
- [x] Binding
- [x] API endpoint
- [x] Service class
- [x] JSON decoding
- [x] Codable structs

## Video



## Obstacles

The biggest challenge was working with the structure of the Hypixel API response. Bazaar products are returned as a dictionary instead of an array, so the app converts the dictionary values into an array before showing them in SwiftUI.

Another challenge was making product names readable because Hypixel product IDs use underscores and symbols. The app creates cleaner display names from those IDs.

## Future Improvements

- Persist favorites permanently with `AppStorage` or SwiftData
- Add item categories
- Add price alerts
- Add charts for price trends
- Add a player lookup tab for Hypixel profiles and recent games†gi
