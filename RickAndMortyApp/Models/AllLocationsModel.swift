//
//  AllLocationsModel.swift
//  RickAndMortyApp
//
//  Created by Mac on 02.06.25.
//

import Foundation

// MARK: - AllLocationsModel
struct AllLocationsModel: Codable {
    let info: Info?
    let results: [AllLocationsResult]?
}

// MARK: - Result
struct AllLocationsResult: Codable {
    let id: Int?
    let name, type, dimension: String?
    let residents: [String]?
    let url: String?
    let created: String?
}
