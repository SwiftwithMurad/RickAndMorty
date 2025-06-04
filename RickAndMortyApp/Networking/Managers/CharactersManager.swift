//
//  CharactersManager.swift
//  RickAndMortyApp
//
//  Created by Mac on 02.06.25.
//

import Foundation

protocol CharactersManagerUseCase {
    func getAllCharacters() async throws -> AllCharactersModel
    func getCharactersWithPagination(nextURL: String) async throws -> AllCharactersModel
}

final class CharactersManager: CharactersManagerUseCase {
    func getAllCharacters() async throws -> AllCharactersModel {
        let helper = NetworkHelper(endpoint: .character)
        do {
            let model = try await NetworkManager.shared.sendRequest(url: helper.requestURL, model: AllCharactersModel.self)
            return model
        } catch {
            throw error
        }
    }
    
    func getCharactersWithPagination(nextURL: String) async throws -> AllCharactersModel {
        do {
            let model = try await NetworkManager.shared.sendRequest(url: nextURL, model: AllCharactersModel.self)
            return model
        } catch {
            throw error
        }
    }
}
