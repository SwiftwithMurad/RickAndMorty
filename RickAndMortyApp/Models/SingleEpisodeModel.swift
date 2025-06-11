//
//  SingleEpisodeModel.swift
//  RickAndMortyApp
//
//  Created by Mac on 02.06.25.
//

import Foundation

//MARK: SingleEpisodeModel
struct SingleEpisodeModel: Codable, EpisodeDetail {
    let id: Int?
    let name, airDate, episode: String?
    let characters: [String]?
    let url: String?
    let created: String?
        
    var episodeData: String {
        episode ?? "NO EPISODE"
    }
    
    var episodeName: String {
        name ?? "NO NAME"
    }
    
    var publishedDate: String {
        airDate ?? "NO DATE"
    }

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}
