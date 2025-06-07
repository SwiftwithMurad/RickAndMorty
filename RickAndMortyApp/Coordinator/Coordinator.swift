//
//  Coordinator.swift
//  RickAndMortyApp
//
//  Created by Mac on 05.06.25.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    func start()
}
