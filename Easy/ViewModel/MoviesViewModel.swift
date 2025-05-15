//
//  MoviesViewModel.swift
//  Easy
//
//  Created by Elai Zuberman on 15/05/2025.
//

import Foundation
import Combine

class MoviesViewModel: BaseViewModel {
        
    @Published var movies: [MovieModel] = []
    @Published var selectedMovie: MovieModel?
    @Published var currentCategory: MoviesCategory = .popular
    
    private var moviesFilter: [MoviesCategory: MovieFilter] = [:]
    private var moviesRepo: MoviesRepository = MoviesRepository()
    
    private var cancellables: Set<AnyCancellable> = .init()
    
    override init(){
        super.init()
        
        for category in MoviesCategory.allCases{
            self.moviesFilter[category] = MovieFilter()
        }
        
        $currentCategory
            .removeDuplicates()
            .sink { [weak self] newCategory in
                self?.getMoviesList(category: newCategory)
            }
            .store(in: &cancellables)
    }
    
    func selectMovie(_ movie: MovieModel) {
        selectedMovie = movie
        Task { @MainActor [weak self] in
            self?.selectedMovie?.trailerKey = await self?.getMovieTrailer(movie.id.description)?.key ?? ""
        }
    }
    
    func loadNextPage() {
        self.getMoviesList(category: self.currentCategory, loadNextPage: true)
    }
    
    // MARK: - Server Requests
    
    private func getMovieTrailer(_ movieId: String) async -> TrailerModel? {
        let result = await self.moviesRepo.getMovieTrailer(movieId: movieId)
        switch result {
        case .success(let response):
            return response.results.first
        case .failure(let error):
            print(error.localizedDescription)
            return nil
        }
    }
    
    private func getMoviesList(category: MoviesCategory, loadNextPage: Bool = false) {
        Task { @MainActor in
            self.isLoading = true
            
            var page = moviesFilter[category]?.currentPage ?? 1
            if loadNextPage{
                page += 1
            }
            
            let result = await moviesRepo.fetchMovies(endpoint: getEndpointByCategory(category), nextPage: page)
            self.isLoading = false

            switch result {
            case .success(let response):
                handleMoviesListResponse(category: category, response: response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func handleMoviesListResponse(category: MoviesCategory, response: PageResponse<[MovieModel]>) {
        self.moviesFilter[category]?.currentPage = response.page
        self.moviesFilter[category]?.movies.append(contentsOf: response.results)
        self.movies = self.moviesFilter[category]?.movies ?? []
    }
    
    private func getEndpointByCategory(_ category: MoviesCategory) -> EndpointRoutes {
        let endpoint: EndpointRoutes
        switch category {
        case .popular: endpoint = .getPopularMovies
        case .topRated: endpoint = .getTopRated
        case .upcoming: endpoint = .getUpcoming
        }
        return endpoint
    }
}
