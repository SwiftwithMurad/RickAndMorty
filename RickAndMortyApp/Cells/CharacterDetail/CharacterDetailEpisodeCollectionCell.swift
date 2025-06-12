//
//  CharacterDetailEpisodeCollectionCell.swift
//  RickAndMortyApp
//
//  Created by Mac on 10.06.25.
//

import UIKit

final class CharacterDetailEpisodeCollectionCell: UICollectionViewCell {
    private lazy var seasonEpisode: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var episodeName: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var episodePublishDate: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var singleEpisode: EpisodeDetail?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.backgroundColor = .tertiarySystemBackground
        contentView.layer.borderWidth = 2
        contentView.layer.cornerRadius = 8
        contentView.layer.borderColor = UIColor.systemBlue.cgColor
        contentView.addSubViews(seasonEpisode, episodeName, episodePublishDate)
        NSLayoutConstraint.activate([
            seasonEpisode.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            seasonEpisode.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            episodeName.topAnchor.constraint(equalTo: seasonEpisode.bottomAnchor, constant: 8),
            episodeName.leadingAnchor.constraint(equalTo: seasonEpisode.leadingAnchor),
            episodeName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),

            episodePublishDate.topAnchor.constraint(equalTo: episodeName.bottomAnchor, constant: 8),
            episodePublishDate.leadingAnchor.constraint(equalTo: episodeName.leadingAnchor),
        ])
    }
    
    func getURL(url: String) {
        let manager = EpisodesManager()
        Task {
            singleEpisode = try await manager.getSingleEpisode(url)
            configureCell()
        }
    }
    
    func configureCell() {
        guard let singleEpisode else { return }
        seasonEpisode.text = "Episode \(singleEpisode.episodeData)"
        episodeName.text = singleEpisode.episodeName
        episodePublishDate.text = "Aired on \(singleEpisode.publishedDate)"
    }
}
