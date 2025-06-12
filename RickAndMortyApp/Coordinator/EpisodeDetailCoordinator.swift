//
//  EpisodeDetailCoordinator.swift
//  RickAndMortyApp
//
//  Created by Mac on 10.06.25.
//

import UIKit

final class EpisodeDetailCoordinator: Coordinator {
    var navigationController: UINavigationController
    private let url: String
    
    init(navigationController: UINavigationController, url: String) {
        self.navigationController = navigationController
        self.url = url
    }
    
    func start() {
        let controller = EpisodeDetailController(viewModel: .init(episodeURL: url))
        controller.navigationItem.largeTitleDisplayMode = .never
        navigationController.show(controller, sender: nil)
    }
}
