//
//  NetworkError.swift
//  RickAndMortyApp
//
//  Created by Mac on 02.06.25.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidStatusCode(Int)
    case invalidResponse
    case invalidData
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Please enter a valid URL."
        case .invalidStatusCode(let status):
            return "Invalid status code: \(status)"
        case .invalidResponse:
            return "Response couldn't be completed."
        case .invalidData:
            return "Data couldn't be decoded."
        }
    }
}
