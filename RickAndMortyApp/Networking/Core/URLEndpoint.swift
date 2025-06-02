//
//  URLEndpoint.swift
//  RickAndMortyApp
//
//  Created by Mac on 02.06.25.
//

import Foundation

@frozen public enum URLEndpoint: String {
    case character = "/character"
    case location = "/location"
    case episode = "/episode"
}
