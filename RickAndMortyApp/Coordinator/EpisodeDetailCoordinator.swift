//
//  EpisodeDetailCoordinator.swift
//  RickAndMortyApp
//
//  Created by Mac on 10.06.25.
//

import UIKit

final class EpisodeDetailCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = EpisodeDetailController(viewModel: .init())
        navigationController.show(controller, sender: nil)
    }
}
