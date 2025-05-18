# EasyMovies

![download](https://github.com/user-attachments/assets/2bdbfb7b-0179-46fe-9e90-3c9c541d3c2f)


# 🎮 Easy Home Assignment

This project is a movie application built using SwiftUI with the following core features:

Filter movies by Popular, Upcoming, and Top Rated

Infinite scrolling to continuously load more content

Favorites system powered by Core Data

Offline support for favorite movies

Custom alert and toast UI

# 📊 Architecture

The app is structured using the MVVM design pattern, which is a natural fit for SwiftUI and one I'm most familiar with. While I considered TCA, due to time constraints and familiarity, I chose to implement MVVM for this project.

# 🌐 Networking Layer

The networking system is designed to be scalable and maintainable:

Uses an `APIRequest` protocol to define each endpoint

The `NetworkManager` handles all requests via `URLSession` using Swift’s async/await

All API calls are managed in the `MoviesRepository`, which inherits from `BaseRepository`

This setup allows future expansions (e.g., adding a "TV Series" module) with minimal effort

Creating a new API endpoint only requires conforming to the `APIRequest` protocol.

# 🧠 View Model

The `MoviesViewModel` is responsible for:

Handling user interactions

Managing state using Combine’s `@Published` and `.sink`

Fetching data based on the selected category

Maintaining a dictionary of `MovieFilter` objects that cache movies by category, including pagination state

# ⭐ Favorites System

Favorites are stored using Core Data, preserving as much of the Movie object as possible to enable:

Offline access to favorite movies

Launching trailers directly from the list

Swipe-to-delete functionality for easy removal

# 📦 Dependencies

SDWebImage: For efficient image loading and caching

AlertToast: A lightweight open-source library I created to show alerts and toasts

# ⚠️ Known Limitations

Network Issues: TheMovieDB API occasionally returns timeout or connection lost errors after the first launch. This issue persisted even after switching from URLSession to Alamofire, so I reverted to URLSession.
