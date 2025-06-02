//
//  SingleCharacterModel.swift
//  RickAndMortyApp
//
//  Created by Mac on 02.06.25.
//

import Foundation

// MARK: - SingleCharacterModel
struct SingleCharacterModel: Codable {
    let id: Int?
    let name, status, species, type: String?
    let gender: String?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}
