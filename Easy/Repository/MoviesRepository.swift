//
//  BaseRepository.swift
//  Easy
//
//  Created by Elai Zuberman on 15/05/2025.
//

import Foundation

class MoviesRepository: BaseRepository {
    
    func fetchMovies(endpoint: EndpointRoutes, nextPage: Int) async -> Result<PageResponse<[MovieModel]>, Error> {
        let request = GetMoviesListRequest(endpoint: endpoint, nextPage: nextPage)
        let result = await networkManager.request(request)
        switch result{
        case .success(let data):
            return .success(data)
        case .failure(let error):
            return .failure(error)
        }
    }
    
    func getMovieTrailer(movieId: String) async -> Result<MovieTrailerResponse, Error> {
        let request = GetMovieTrailerRequest(movieId: movieId)
        let result = await networkManager.request(request)
        switch result{
        case .success(let data):
            return .success(data)
        case .failure(let error):
            return .failure(error)
        }
    }
}
