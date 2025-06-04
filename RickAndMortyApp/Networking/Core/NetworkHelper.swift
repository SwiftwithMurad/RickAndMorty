//
//  NetworkHelper.swift
//  RickAndMortyApp
//
//  Created by Mac on 02.06.25.
//

import Foundation

final class NetworkHelper {
    private let baseUrl = "https://rickandmortyapi.com/api"
    private let endpoint: URLEndpoint
    private let next: String
    
    init(endpoint: URLEndpoint, next: String = "") {
        self.endpoint = endpoint
        self.next = next
    }
}

extension NetworkHelper {
    var requestURL: String {
        return baseUrl + endpoint.rawValue
    }
}
