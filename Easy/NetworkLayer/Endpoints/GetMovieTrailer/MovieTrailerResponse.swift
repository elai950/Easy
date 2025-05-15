//
//  MovieTrailerResponse.swift
//  Easy
//
//  Created by Elai Zuberman on 15/05/2025.
//

import Foundation

class MovieTrailerResponse: Decodable{
    let id: Int
    let results: [TrailerModel]
}
