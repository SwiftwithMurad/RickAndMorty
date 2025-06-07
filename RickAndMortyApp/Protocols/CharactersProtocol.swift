//
//  CharactersProtocol.swift
//  RickAndMortyApp
//
//  Created by Mac on 07.06.25.
//

import Foundation

protocol CharacterDetail {
    var imageData: String { get }
    var nameData: String { get }
    var statusData: String { get }
    var genderData: String { get }
    var typeData: String { get }
    var speciesData: String { get }
    var originData: String { get }
    var locationData: String { get }
    var createdData: String { get }
    var episodeCountData: Int { get }
}

protocol CharacterResult: CharacterDetail {
    var imageData: String { get }
    var nameData: String { get }
    var statusData: String { get }
}
