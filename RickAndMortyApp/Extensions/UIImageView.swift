//
//  UIImageView.swift
//  RickAndMortyApp
//
//  Created by Mac on 03.06.25.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with urlString: String?) {
        guard let urlString, let url = URL(string: urlString) else { return }
        self.kf.setImage(with: url)
    }
}
