//
//  MovieModel.swift
//  Easy
//
//  Created by Elai Zuberman on 15/05/2025.
//

import Foundation

struct MovieModel: Identifiable, Decodable, Hashable{
    
    var id                  : Int = 0
    var adult               : Bool = false
    var backdropPath        : String = ""
    var genreIds            : [Int] = []
    var originalLanguage    : String = ""
    var originalTitle       : String = ""
    var overview            : String = ""
    var popularity          : Double = 0
    var posterPath          : String = ""
    var releaseDate         : String = ""
    var title               : String = ""
    var video               : Bool = false
    var voteAverage         : Double = 0
    var voteCount           : Int = 0
    
    var trailerKey          : String = ""
    
    enum CodingKeys: String, CodingKey {
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case adult
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
    }
}
