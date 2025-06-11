//
//  EpisodesViewModel.swift
//  RickAndMortyApp
//
//  Created by Mac on 05.06.25.
//

import Foundation

final class EpisodesViewModel {
    private let manager = EpisodesManager()
    private(set) var episodes = [AllEpisodesResult]()
    
    func fetchEpisodes() {
        Task {
            episodes = try await manager.getAllEpisodes().results ?? []  
            print(episodes)
        }
    }
}
