//
//  NetworkManager.swift
//  Easy
//
//  Created by Elai Zuberman on 15/05/2025.
//

import Foundation

class NetworkManager{
    
    func request<T: APIRequest>(_ request: T) async -> Result<T.ReturnType, Error> {
        do {
            let urlRequest = makeURLRequest(for: request)
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let decoder = JSONDecoder()
            let model = try decoder.decode(T.ReturnType.self, from: data)
            return .success(model)
        } catch let error {
            return .failure(error)
        }
    }
    
    private func makeURLRequest(for request: any APIRequest) -> URLRequest {
        let url = URL(string: request.endpoint.endpointAddress)!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        
        var queryItems: [URLQueryItem] = []
        
        for query in request.queries{
            let item = URLQueryItem(name: query.key, value: query.value)
            queryItems.append(item)
        }
        
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems
        
        var req = URLRequest(url: components.url!)
        req.httpMethod = request.method.rawValue
        req.allHTTPHeaderFields = request.headers
        req.timeoutInterval = request.timeoutInterval
        return req
    }
    
}
