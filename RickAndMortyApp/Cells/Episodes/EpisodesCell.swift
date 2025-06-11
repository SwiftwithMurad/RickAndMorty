//
//  EpisodesCell.swift
//  RickAndMortyApp
//
//  Created by Mac on 11.06.25.
//

import UIKit

final class EpisodesCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
    }
}
