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
    let results: [SingleEpisodeModel]?
}
