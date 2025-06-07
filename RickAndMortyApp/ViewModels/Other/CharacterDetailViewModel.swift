//
//  CharacterDetailViewModel.swift
//  RickAndMortyApp
//
//  Created by Mac on 05.06.25.
//

import Foundation

final class CharacterDetailViewModel {
    private var characterURL: String
    private(set) var characterResult: AllCharactersResult
    
    init(characterURL: String, characterResult: AllCharactersResult) {
        self.characterURL = characterURL
        self.characterResult = characterResult
    }
    
    func getURL() -> URL {
        guard let url = URL(string: characterURL) else { return URL(fileURLWithPath: "") }
        return url
    }
}
