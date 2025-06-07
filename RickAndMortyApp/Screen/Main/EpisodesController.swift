//
//  EpisodesController.swift
//  RickAndMortyApp
//
//  Created by Mac on 02.06.25.
//

import UIKit

final class EpisodesController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        handleTitle(with: "Episodes")
        view.backgroundColor = .systemBackground
        showSearchButton()
    }
}
