//
//  GetMovieTrailerRequest.swift
//  Easy
//
//  Created by Elai Zuberman on 15/05/2025.
//

import Foundation

class GetMovieTrailerRequest: APIRequest{
    typealias ReturnType = MovieTrailerResponse
    var endpoint: EndpointRoutes
    
    init(movieId: String){
        self.endpoint = .getTrailer(moveId: movieId)
    }
}
