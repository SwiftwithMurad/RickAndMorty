//
//  CharacterDetailViewModel.swift
//  RickAndMortyApp
//
//  Created by Mac on 05.06.25.
//

import Foundation

final class CharacterDetailViewModel {
    private var characterURL: String
    private let manager: CharacterDetailManagerUseCase
    private(set) var singleCharacter: SingleCharacterModel?
    private(set) var characterCellData = [CharacterDetailModel]()
    var sendState: ((ViewState) -> Void)?
    
    private var state: ViewState = .idle {
        didSet {
            sendState?(state)
        }
    }
    
    init(characterURL: String, manager: CharacterDetailManagerUseCase) {
        self.characterURL = characterURL
        self.manager = manager
    }
    
    func fetchSingleCharacter() {
        state = .loading
        Task {
            do {
                singleCharacter = try await manager.getSingleCharacter(with: getURL().absoluteString)
                characterCellData = getCharacterCellData(with: &characterCellData)
                state = .success
                state = .loaded
            } catch {
                state = .error(error.localizedDescription)
                state = .loaded
            }
        }
    }
    
    private func getCharacterCellData(with data: inout [CharacterDetailModel]) -> [CharacterDetailModel] {
        data = [
            .init(cellTitle: "STATUS", name: singleCharacter?.statusData ?? "NO STATUS"),
            .init(cellTitle: "GENDER", name: singleCharacter?.genderData ?? "NO GENDER"),
            .init(cellTitle: "TYPE", name: singleCharacter?.typeData ?? "NO TYPE"),
            .init(cellTitle: "SPECIES", name: singleCharacter?.speciesData ?? "NO SPECIES"),
            .init(cellTitle: "ORIGIN", name: singleCharacter?.originData ?? "NO ORIGIN"),
            .init(cellTitle: "LOCATION", name: singleCharacter?.locationData ?? "NO LOCATION"),
            .init(cellTitle: "CREATED", name: singleCharacter?.createdData ?? "NO CREATED"),
            .init(cellTitle: "EPISODECOUNT", name: "\(singleCharacter?.episodeCountData ?? 0)")
        ]
        return data
    }
    
    func getURL() -> URL {
        guard let url = URL(string: characterURL) else { return URL(fileURLWithPath: "") }
        return url
    }
}
