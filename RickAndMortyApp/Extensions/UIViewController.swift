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
    
    func showAlert(with title: String = "Error happened", and message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}
