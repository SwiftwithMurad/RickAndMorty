//
//  SingleCharacterModel.swift
//  RickAndMortyApp
//
//  Created by Mac on 02.06.25.
//

import Foundation

// MARK: - SingleCharacterModel
struct SingleCharacterModel: Codable, CharacterResult {
    let id: Int?
    let name, status, species, type: String?
    let gender: String?
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
        status ?? "NO STATUS"
    }
    
    var genderData: String {
        gender ?? "NO GENDER"
    }
    
    var typeData: String {
        guard let type else { return "NO TYPE"}
        return type.isEmpty ? "None": type
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
