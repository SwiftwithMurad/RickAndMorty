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
    private var nextURL: String?
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
    
    func paginate() {
        Task {
            do {
                allCharacters = try await manager.getAllCharacters()
                let data = try await manager.getCharactersWithPagination(nextURL: allCharacters?.info?.next ?? "NO URL").results ?? []
                nextURL = allCharacters?.info?.next
                characterModel.append(contentsOf: data)
                state = .success
            } catch {
                state = .error(error.localizedDescription)
            }
        }
    }
}
