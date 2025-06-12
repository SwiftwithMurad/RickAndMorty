//
//  EpisodesController.swift
//  RickAndMortyApp
//
//  Created by Mac on 02.06.25.
//

import UIKit

final class EpisodesController: BaseController {
    private lazy var table: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.delegate = self
        table.dataSource = self
        table.register(EpisodesCell.self, forCellReuseIdentifier: "\(EpisodesCell.self)")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private let viewModel = EpisodesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        handleTitle(with: "Episodes")
        view.backgroundColor = .systemBackground
        showSearchButton()
    }
    
    override func configureConstraints() {
        view.addSubview(table)
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    override func configureViewModel() {
        viewModel.sendState = { [weak self] state in
            guard let self else { return }
            DispatchQueue.main.async {
                switch state {
                case .loading:
                    break
                case .loaded:
                    break
                case .success:
                    self.table.reloadData()
                case .error(let error):
                    self.showAlert(and: error)
                case .idle:
                    break
                }
            }
        }
        viewModel.fetchEpisodes()
    }
}

extension EpisodesController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(EpisodesCell.self)") as? EpisodesCell else {
            return UITableViewCell()
        }
        cell.configureCell(with: viewModel.episodes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let coordinator = EpisodeDetailCoordinator(navigationController: navigationController ?? UINavigationController(),
                                                   url: viewModel.episodes[indexPath.row].url ?? "NO URL")
        coordinator.start()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        viewModel.paginateEpisodes(index: indexPath.row)
    }
}
