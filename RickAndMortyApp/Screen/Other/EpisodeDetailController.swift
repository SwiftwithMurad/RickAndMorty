//
//  EpisodeDetailController.swift
//  RickAndMortyApp
//
//  Created by Mac on 10.06.25.
//

import UIKit

class EpisodeDetailController: BaseController {
    private lazy var shareSheet: UIActivityViewController = {
        let share = UIActivityViewController(activityItems: [viewModel.getURL()], applicationActivities: nil)
        return share
    }()

    private let viewModel: EpisodeDetailViewModel
    
    init(viewModel: EpisodeDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func shareButtonTapped() {
        present(shareSheet, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        view.backgroundColor = .systemBackground
        title = "Episode"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"),
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(shareButtonTapped))
    }
}
