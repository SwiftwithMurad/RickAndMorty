//
//  EpisodesViewModel.swift
//  RickAndMortyApp
//
//  Created by Mac on 05.06.25.
//

import Foundation

final class EpisodesViewModel {
    private let manager = EpisodesManager()
    private(set) var episodes = [SingleEpisodeModel]()
    private var nextURL: String? = NetworkHelper(endpoint: .episode).requestURL + "?page=2"
    var sendState: ((ViewState) -> Void)?
    
    private var state: ViewState = .idle {
        didSet {
            sendState?(state)
        }
    }
    
    func fetchEpisodes() {
        state = .loading
        Task {
            do {
                episodes = try await manager.getAllEpisodes().results ?? []
//                print("EPISODES: \(episodes)")
                state = .success
                state = .loaded
            } catch {
                state = .error(error.localizedDescription)
                state = .loaded
            }
        }
    }
    
    func paginateEpisodes(index: Int) {
        Task {
            do {
                guard index == episodes.count - 1, nextURL != nil else { return }
                let data = try await manager.getEpisodesWithPagination(with: nextURL ?? "")
                nextURL = data.info?.next ?? "NO URL"
                episodes.append(contentsOf: data.results ?? [])
                state = .success
            } catch {
                guard nextURL != nil else { return }
            }
        }
    }
}
