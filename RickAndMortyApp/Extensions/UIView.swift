//
//  UIView.swift
//  RickAndMortyApp
//
//  Created by Mac on 02.06.25.
//

import UIKit

extension UIView {
    func addSubViews(_ views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
}
