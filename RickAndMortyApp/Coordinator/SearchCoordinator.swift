//
//  SearchCoordinator.swift
//  RickAndMortyApp
//
//  Created by Mac on 05.06.25.
//

import UIKit

final class SearchCoordinator: Coordinator {
    var navigationController: UINavigationController
    private let title: String
    
    init(navigationController: UINavigationController, title: String) {
        self.navigationController = navigationController
        self.title = title
    }
    
    func start() {
        let controller = SearchController()
        controller.title = "Search \(title)"
        controller.navigationItem.largeTitleDisplayMode = .never
        navigationController.show(controller, sender: nil)
    }
}
