//
//  MovieFilter.swift
//  Easy
//
//  Created by Elai Zuberman on 15/05/2025.
//

import Foundation

enum MoviesCategory: String, CaseIterable{
    case popular
    case topRated
    case upcoming
}

struct MovieFilter{
    var currentPage: Int = 1
    var movies: [MovieModel] = []
}
