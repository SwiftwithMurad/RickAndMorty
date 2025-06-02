//
//  NetworkHelper.swift
//  RickAndMortyApp
//
//  Created by Mac on 02.06.25.
//

import Foundation

final class NetworkHelper {
    let baseUrl = "https://rickandmortyapi.com/api"
    
    let endpoint: URLEndpoint
    
    init(endpoint: URLEndpoint) {
        self.endpoint = endpoint
    }
}

extension NetworkHelper {
    var requestURL: String {
        return baseUrl + endpoint.rawValue
    }
}
