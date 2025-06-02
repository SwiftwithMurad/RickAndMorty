//
//  UIStackView.swift
//  RickAndMortyApp
//
//  Created by Mac on 02.06.25.
//

import UIKit

extension UIStackView {
    func addArrangedSubViews(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
