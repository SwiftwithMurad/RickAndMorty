//
//  SettingsController.swift
//  RickAndMortyApp
//
//  Created by Mac on 02.06.25.
//

import UIKit

final class SettingsController: BaseController { 

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        handleTitle(with: "Settings")
        view.backgroundColor = .systemBackground
    }
}
