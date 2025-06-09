//
//  CharacterDetailManager.swift
//  RickAndMortyApp
//
//  Created by Mac on 08.06.25.
//

import Foundation

protocol CharacterDetailManagerUseCase {
    func getSingleCharacter(with url: String) async throws -> SingleCharacterModel
}

final class CharacterDetailManager: CharacterDetailManagerUseCase {
    func getSingleCharacter(with url: String) async throws -> SingleCharacterModel {
        do {
            let data = try await NetworkManager.shared.sendRequest(url: url, model: SingleCharacterModel.self)
            return data
        } catch {
            throw error
        }
    }
}
