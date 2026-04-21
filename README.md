# Hypixel Bazaar Tracker

## API Used

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

## Video

<p align="center">
  <img src="Media/vid.gif" width="200">

## Obstacles

The biggest challenge was working with the structure of the Hypixel API response. Bazaar products are returned as a dictionary instead of an array, so the app has to convet the dictionary values into an array before showing them in the app. This was hard because each and every product has something different. 

Another challenge was making product names readable because Hypixel product IDs use underscores and symbols. I fixed this so that the app creates better looking display names from those IDs.

Lastly, a challenge encountered was making sure that there were a certain amount of items on the screen at once because before we had that, it ended up being very laggy. 

## Future Improvements

- Favorite items to flip
- Add item categories
- Add price alerts
- Add charts for price trends
- Add a player lookup tab for Hypixel profiles and recent games†gi
