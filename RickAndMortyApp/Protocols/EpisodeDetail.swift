//
//  EpisodeDetail.swift
//  RickAndMortyApp
//
//  Created by Mac on 10.06.25.
//

import Foundation

protocol EpisodeDetail {
    var episodeData: String { get }
    var episodeName: String { get }
    var publishedDate: String { get }
}
