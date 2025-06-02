//
//  NetworkManager.swift
//  RickAndMortyApp
//
//  Created by Mac on 02.06.25.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func sendRequest<T: Codable>(url: String,
                                 model: T.Type,
                                 method: String = "GET") async throws -> T {
        guard let url = URL(string: url) else { throw NetworkError.invalidURL }
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            let status = httpResponse.statusCode
            throw NetworkError.invalidStatusCode(status)
        }
        
        do {
            let model = try JSONDecoder().decode(T.self, from: data)
            return model
        } catch {
            throw NetworkError.invalidData
        }
    }
}
