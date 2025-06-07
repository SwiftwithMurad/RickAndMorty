//
//  CharacterDetailCoordinator.swift
//  RickAndMortyApp
//
//  Created by Mac on 05.06.25.
//

import UIKit

final class CharacterDetailCoordinator: Coordinator {
    var navigationController: UINavigationController
    private let title: String
    private let url: String
    private let characterResult: AllCharactersResult
    
    init(navigationController: UINavigationController, title: String, url: String, characterResult: AllCharactersResult) {
        self.navigationController = navigationController
        self.title = title
        self.url = url
        self.characterResult = characterResult
    }
    
    func start() {
        let controller = CharacterDetailController(viewModel: .init(characterURL: url,
                                                                    characterResult: characterResult))
        controller.title = title
        controller.hidesBottomBarWhenPushed = true
        controller.navigationItem.largeTitleDisplayMode = .never
        navigationController.show(controller, sender: nil)
    }
}
