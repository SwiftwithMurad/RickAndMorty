//
//  CharacterDetailCell.swift
//  RickAndMortyApp
//
//  Created by Mac on 08.06.25.
//

import UIKit

struct CharacterDetailModel {
    let cellTitle: String
    let name: String
}

class CharacterDetailCell: UICollectionViewCell {
    private lazy var bellImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "bell")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cellNameView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var cellName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var model = [CharacterDetailModel]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = .tertiarySystemBackground
        contentView.addSubViews(bellImage, nameLabel, cellNameView)
        cellNameView.addSubview(cellName)
        NSLayoutConstraint.activate([
            bellImage.widthAnchor.constraint(equalToConstant: 30),
            bellImage.heightAnchor.constraint(equalToConstant: 30),
            bellImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            bellImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            
            nameLabel.leadingAnchor.constraint(equalTo: bellImage.trailingAnchor, constant: 16),
            nameLabel.centerYAnchor.constraint(equalTo: bellImage.centerYAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            cellNameView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellNameView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellNameView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellNameView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.33),
            
            cellName.centerXAnchor.constraint(equalTo: cellNameView.centerXAnchor),
            cellName.centerYAnchor.constraint(equalTo: cellNameView.centerYAnchor),
        ])
    }
    
    func configureCell(with model: CharacterDetailModel) {
        nameLabel.text = model.name
        cellName.text = model.cellTitle
    }
}
