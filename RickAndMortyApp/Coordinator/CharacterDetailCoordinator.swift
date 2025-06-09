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
    
    init(navigationController: UINavigationController, title: String, url: String) {
        self.navigationController = navigationController
        self.title = title
        self.url = url
    }
    
    func start() {
        let controller = CharacterDetailController(viewModel: .init(characterURL: url,
                                                                    manager: CharacterDetailManager()))
        controller.title = title
        controller.hidesBottomBarWhenPushed = true
        controller.navigationItem.largeTitleDisplayMode = .never
        navigationController.show(controller, sender: nil)
    }
}
