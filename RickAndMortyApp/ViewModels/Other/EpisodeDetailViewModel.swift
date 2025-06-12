//
//  EpisodeDetailViewModel.swift
//  RickAndMortyApp
//
//  Created by Mac on 11.06.25.
//

import Foundation

final class EpisodeDetailViewModel {
    private let episodeURL: String
    
    init(episodeURL: String) {
        self.episodeURL = episodeURL
    }
    
    func getURL() -> URL? {
        guard let url = URL(string: episodeURL) else { return nil }
        return url
    }
}
