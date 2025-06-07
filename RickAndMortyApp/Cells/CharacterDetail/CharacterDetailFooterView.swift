//
//  CharacterDetailFooterView.swift
//  RickAndMortyApp
//
//  Created by Mac on 07.06.25.
//

import UIKit

class CharacterDetailFooterView: UICollectionReusableView {
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubViews(collection)
        NSLayoutConstraint.activate([
            
        ])
    }
}
