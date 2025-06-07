//
//  AllCharactersModel.swift
//  RickAndMortyApp
//
//  Created by Mac on 02.06.25.
//

import Foundation

// MARK: - AllCharactersModel
struct AllCharactersModel: Codable {
    var info: Info?
    let results: [AllCharactersResult]?
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int?
    var next, prev: String?
}

// MARK: - Result
struct AllCharactersResult: Codable, CharacterResult {
    let id: Int?
    let name: String?
    let status: Status?
    let species: String?
    let type: String?
    let gender: Gender?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
    
    var imageData: String {
        image ?? "NO IMAGE"
    }
    
    var nameData: String {
        name ?? "NO NAME"
    }
    
    var statusData: String {
        status?.rawValue ?? "NO STATUS" 
    }
    
    var genderData: String {
        gender?.rawValue ?? "NO GENDER"
    }
    
    var typeData: String {
        type ?? "NO TYPE"
    }
    
    var speciesData: String {
        species ?? "NO SPECIES"
    }
    
    var originData: String {
        origin?.name ?? "NO ORIGIN"
    }
    
    var locationData: String {
        location?.name ?? "NO LOCATION"
    }
    
    var createdData: String {
        created ?? "NO DATA"
    }
    
    var episodeCountData: Int {
        episode?.count ?? 0
    }
}

enum Gender: String, Codable {
    case female = "Female"
    case genderless = "Genderless"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Codable {
    let name: String?
    let url: String?
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
    
    var description: String {
        switch self {
        case .alien:
            return "Alien"
        case .human:
            return "Human"
        }
    }
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
    
    var description: String {
        switch self {
        case .alive:
            return "Alive"
        case .dead:
            return "Dead"
        case .unknown:
            return "Unknown"
        }
    }
}
