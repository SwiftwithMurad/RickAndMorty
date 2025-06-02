//
//  UIViewController.swift
//  RickAndMortyApp
//
//  Created by Mac on 03.06.25.
//

import UIKit

extension UIViewController {
    func handleTitle(with title: String) {
        self.title = title
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
