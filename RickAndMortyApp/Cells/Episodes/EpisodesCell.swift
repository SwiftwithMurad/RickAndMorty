//
//  EpisodesCell.swift
//  RickAndMortyApp
//
//  Created by Mac on 11.06.25.
//

import UIKit

final class EpisodesCell: UITableViewCell {
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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.layer.borderWidth = 2
        contentView.layer.cornerRadius = 8
        contentView.layer.borderColor = UIColor.systemRed.cgColor
    }
    
    private func configureConstraints() {
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
    
    func configureCell(with data: EpisodeDetail) {
        seasonEpisode.text = "Episode \(data.episodeData)"
        episodeName.text = data.episodeName
        episodePublishDate.text = "Aired on \(data.publishedDate)"
    }
}
