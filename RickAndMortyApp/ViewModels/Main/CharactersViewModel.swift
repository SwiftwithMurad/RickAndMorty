//
//  CharactersViewModel.swift
//  RickAndMortyApp
//
//  Created by Mac on 02.06.25.
//

import Foundation

final class CharactersViewModel {
    private let manager = CharactersManager()
    private(set) var characterModel = [AllCharactersResult]()
    private var allCharacters: AllCharactersModel?
    private var nextURL: String = NetworkHelper(endpoint: .character).requestURL + "?page=2"
    var sendState: ((ViewState) -> Void)?
    
    private var state: ViewState = .idle {
        didSet {
            sendState?(state)
        }
    }
    
    func getCharacters() {
        Task {
            state = .loading
            do {
                characterModel = try await manager.getAllCharacters().results ?? []
                state = .loaded
                state = .success
            } catch {
                state = .error(error.localizedDescription)
                state = .loaded
            }
        }
    }
    
    func paginateCharacters(index: Int) {
        Task {
            do {
                guard index == characterModel.count - 2 else { return }
                let data = try await manager.getCharactersWithPagination(nextURL: nextURL)
                nextURL = data.info?.next ?? "NO URL"
                characterModel.append(contentsOf: data.results ?? [])
                state = .success
            } catch {
                state = .error(error.localizedDescription)
            }
        }
    }
    
    func refresh() {
        characterModel.removeAll()
        allCharacters = nil
        getCharacters()
        nextURL = NetworkHelper(endpoint: .character).requestURL + "?page=2"
        state = .success
    }
}
