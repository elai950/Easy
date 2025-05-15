//
//  APIRequest.swift
//  Easy
//
//  Created by Elai Zuberman on 15/05/2025.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
}

protocol APIRequest{
    associatedtype ReturnType: Decodable
    
    var endpoint: EndpointRoutes { get set }
    var method: HTTPMethod { get }
    var timeoutInterval: TimeInterval { get }
    var headers: [String: String] { get }
    var queries: [String: String] { get }
}

extension APIRequest{
    
    var method: HTTPMethod{
        .GET
    }
    
    var queries: [String: String] {
        [
            "language": "en-US",
            "page": "1"
        ]
    }
    
    var headers: [String: String] {
        [
          "Content-Type": "application/json",
          "Authorization": "Bearer \(Utils.getValueFromPlist(forKey: "APIKey") ?? "")"
        ]
    }
    
    var timeoutInterval: TimeInterval {
        10
    }
}
