//
//  MoviesRequest.swift
//  Easy
//
//  Created by Elai Zuberman on 15/05/2025.
//

import Foundation

class GetMoviesListRequest: APIRequest{
    typealias ReturnType = PageResponse<[MovieModel]>
    var endpoint: EndpointRoutes = .getPopularMovies
    
    var queries: [String : String]
    
    init(endpoint: EndpointRoutes, nextPage: Int){
        self.endpoint = endpoint
        
        self.queries = [
            "language": "en-US",
            "page": nextPage.description
        ]
    }
}
