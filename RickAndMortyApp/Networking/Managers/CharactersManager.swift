//
//  CharactersManager.swift
//  RickAndMortyApp
//
//  Created by Mac on 02.06.25.
//

import Foundation

protocol CharactersManagerUseCase {
    func getAllCharacters() async -> AllCharactersModel?
}

final class CharactersManager: CharactersManagerUseCase {
    
    func getAllCharacters() async -> AllCharactersModel? {
        let helper = NetworkHelper(endpoint: .character)
        do {
            let model = try await NetworkManager.shared.sendRequest(url: helper.requestURL, model: AllCharactersModel.self)
            return model
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
