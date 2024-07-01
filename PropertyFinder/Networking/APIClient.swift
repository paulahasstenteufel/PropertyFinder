//
//  APIClient.swift
//  PropertyFinder
//
//  Created by Paula Hasstenteufel on 2024-06-29.
//

import Foundation

protocol APIClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint, model: T.Type) async -> Result<T, RequestError>
}

extension APIClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint, model: T.Type) async -> Result<T, RequestError> {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        
        guard let url = urlComponents.url else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            guard let _ = response as? HTTPURLResponse else {
                return .failure(.noData)
            }
            
            guard let decodedResponse = try? JSONDecoder().decode(model.self, from: data) else {
                return .failure(.decodingFailed)
            }
            
            return .success(decodedResponse)
            
        } catch {
            return .failure(.unknown)
        }
    }
}
