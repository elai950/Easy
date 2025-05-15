//
//  PageResponse.swift
//  Easy
//
//  Created by Elai Zuberman on 15/05/2025.
//

class PageResponse<T: Decodable>: Decodable{
    
    let results         : T
    let page            : Int
    let totalPage       : Int
    let total_Results   : Int
    
    enum CodingKeys: String, CodingKey {
        case results
        case page
        case totalPage = "total_pages"
        case total_Results = "total_results"
    }
}
