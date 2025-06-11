//
//  EpisodesManager.swift
//  RickAndMortyApp
//
//  Created by Mac on 02.06.25.
//

import Foundation

protocol EpisodesManagerUseCase {
    func getAllEpisodes() async throws -> AllEpisodesModel
    func getSingleEpisode(_ url: String) async throws -> SingleEpisodeModel
}

final class EpisodesManager: EpisodesManagerUseCase {
    func getAllEpisodes() async throws -> AllEpisodesModel {
        let helper = NetworkHelper(endpoint: .episode)
        do {
            let data = try await NetworkManager.shared.sendRequest(url: helper.requestURL, model: AllEpisodesModel.self)
            return data
        } catch {
            throw error
        }
    }
    
    func getSingleEpisode(_ url: String) async throws -> SingleEpisodeModel {
        do {
            let data = try await NetworkManager.shared.sendRequest(url: url, model: SingleEpisodeModel.self)
            return data
        } catch {
            throw error
        }
    }
}
