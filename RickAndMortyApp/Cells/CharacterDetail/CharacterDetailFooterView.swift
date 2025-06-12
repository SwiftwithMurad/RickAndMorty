//
//  CharacterDetailFooterView.swift
//  RickAndMortyApp
//
//  Created by Mac on 07.06.25.
//

import UIKit

protocol CharacterDetailFooterDelegate: AnyObject {
    func didSelectEpisode(at index: Int)
}

final class CharacterDetailFooterView: UICollectionReusableView {
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 0)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.register(CharacterDetailEpisodeCollectionCell.self,
                            forCellWithReuseIdentifier: "\(CharacterDetailEpisodeCollectionCell.self)")
        collection.delegate = self
        collection.dataSource = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private var episodesUrl = [String]()
    weak var delegate: CharacterDetailFooterDelegate?
    
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
            collection.topAnchor.constraint(equalTo: topAnchor),
            collection.leadingAnchor.constraint(equalTo: leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            collection.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    func addEpisodes(_ episodes: [String]) {
        episodesUrl = episodes
        collection.reloadData()
    }
}

extension CharacterDetailFooterView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        episodesUrl.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CharacterDetailEpisodeCollectionCell.self)",
                                                            for: indexPath) as? CharacterDetailEpisodeCollectionCell else {
            return UICollectionViewCell()
        }
        cell.getURL(url: episodesUrl[indexPath.row])
        print(episodesUrl[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectEpisode(at: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width - 120, height: 120)
    }
}
