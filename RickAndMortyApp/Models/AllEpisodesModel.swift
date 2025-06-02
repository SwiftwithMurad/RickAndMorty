//
//  AllEpisodesModel.swift
//  RickAndMortyApp
//
//  Created by Mac on 02.06.25.
//

import Foundation

//MARK: AllEpisodesModel
struct AllEpisodesModel: Codable {
    let info: Info?
    let results: [AllEpisodesResult]?
}

// MARK: - Result
struct AllEpisodesResult: Codable {
    let id: Int?
    let name, airDate, episode: String?
    let characters: [String]?
    let url: String?
    let created: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}
