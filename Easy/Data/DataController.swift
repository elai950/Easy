//
//  DataController.swift
//  Easy
//
//  Created by Elai Zuberman on 15/05/2025.
//

import Foundation
import CoreData

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "FavoriteMovie")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
    private func saveData() -> Bool {
        if container.viewContext.hasChanges{
            do {
                try container.viewContext.save()
                return true
            } catch {
                print(error.localizedDescription)
                return false
            }
        }
        return false
    }
    
    func convertToModel(_ movie: FavoriteMovie) -> MovieModel{
        var model = MovieModel()
        model.id = Int(movie.id ?? "0") ?? 0
        model.title = movie.title ?? ""
        model.overview = movie.overview ?? ""
        model.posterPath = movie.posterUrlPath ?? ""
        model.trailerKey = movie.trailerUrlPath ?? ""
        model.voteAverage = movie.voteAverage
        model.voteCount = Int(movie.voteCount ?? "0") ?? 0
        model.releaseDate = movie.releaseDate ?? ""
        return model
    }
    
    func favoriteMovie(_ movie: MovieModel, posterUrlPath: String? = nil) -> Bool {
        let favorite = FavoriteMovie(context: container.viewContext)
        favorite.id = movie.id.description
        favorite.title = movie.title
        favorite.overview = movie.overview
        favorite.trailerUrlPath = movie.trailerKey
        favorite.posterUrlPath = posterUrlPath ?? ""
        favorite.voteAverage = movie.voteAverage
        favorite.releaseDate = movie.releaseDate
        favorite.voteCount = movie.voteCount.description
        return saveData()
    }
    
    @discardableResult
    func unFavoriteMovie(_ movie: FavoriteMovie) -> Bool {
        container.viewContext.delete(movie)
        return saveData()
    }
    
}
