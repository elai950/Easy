//
//  TrailerModel.swift
//  Easy
//
//  Created by Elai Zuberman on 15/05/2025.
//

import Foundation

class TrailerModel: Decodable{
    let iso_639_1       : String
    let iso_3166_1      : String
    let name            : String
    let key             : String
    let site            : String
    let size            : Int
    let type            : String
    let official        : Bool
    let publishedAt     : String
    let id              : String

    enum CodingKeys: String, CodingKey {
        case iso_639_1 = "iso_639_1"
        case iso_3166_1 = "iso_3166_1"
        case publishedAt = "published_at"
        case name
        case key
        case site
        case size
        case type
        case official
        case id
    }
}
