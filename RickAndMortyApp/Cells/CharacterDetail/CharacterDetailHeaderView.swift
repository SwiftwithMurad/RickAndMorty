//
//  CharacterDetailHeaderView.swift
//  RickAndMortyApp
//
//  Created by Mac on 06.06.25.
//

import UIKit

final class CharacterDetailHeaderView: UICollectionReusableView {
    private lazy var characterImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var isImageShowed = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        addSubview(characterImage)
        NSLayoutConstraint.activate([
            characterImage.topAnchor.constraint(equalTo: topAnchor),
            characterImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            characterImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            characterImage.heightAnchor.constraint(equalToConstant: frame.height)
        ])
    }
    
    func configureHeader(with image: String) {
        if isImageShowed {
            characterImage.setImage(with: image)
        }
        isImageShowed = true
    }
}
