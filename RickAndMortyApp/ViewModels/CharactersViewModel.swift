//
//  CharactersViewModel.swift
//  RickAndMortyApp
//
//  Created by Mac on 02.06.25.
//

import Foundation

class CharactersViewModel {
    let manager = CharactersManager()
    
    func getCharacters() {
        Task {
            await manager.getAllCharacters()
        }
    }
}
