//
//  EndpointRoutes.swift
//  Easy
//
//  Created by Elai Zuberman on 15/05/2025.
//

import Foundation

enum EndpointRoutes{
    case getPopularMovies
    case getTopRated
    case getUpcoming
    case getImage(path: String)
    case getTrailer(moveId: String)
    
    private var mainUrl: String{
        Utils.getValueFromPlist(forKey: "APIBaseUrl") ?? ""
    }
    
    private var imageUrl: String{
        Utils.getValueFromPlist(forKey: "API_ImageUrl") ?? ""
    }
    
    var endpointAddress: String{
        switch self{
        case .getPopularMovies:
            return "\(mainUrl)/movie/popular"
        case .getTopRated:
            return "\(mainUrl)/movie/top_rated"
        case .getUpcoming:
            return "\(mainUrl)/movie/upcoming"
        case .getImage(let path):
            return "\(imageUrl)\(path)"
        case .getTrailer(let movieId):
            return "\(mainUrl)/movie/\(movieId)/videos"
        }
    }
}
