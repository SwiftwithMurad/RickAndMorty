//
//  CharactersController.swift
//  RickAndMortyApp
//
//  Created by Mac on 02.06.25.
//

import UIKit

final class CharactersController: BaseController {
    private lazy var refreshControl: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(refreshStarted), for: .valueChanged)
        return refresh
    }()
    
    private lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.register(CharactersCell.self, forCellWithReuseIdentifier: "\(CharactersCell.self)")
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private let viewModel = CharactersViewModel()
    
    @objc private func refreshStarted() {
        viewModel.refresh()
        refreshControl.endRefreshing()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()       
    }
    
    override func configureUI() {
        handleTitle(with: "Characters")
        view.backgroundColor = .systemBackground
        view.addSubViews(spinner, collection)
        collection.refreshControl = refreshControl
        showSearchButton()
    }
    
    override func configureConstraints() {
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    override func configureViewModel() {
        viewModel.sendState = { [weak self] state in
            guard let self else { return }
            DispatchQueue.main.async {
                switch state {
                case .success:
                    self.collection.reloadData()
                case .loading:
                    self.spinner.startAnimating()
                case .loaded:
                    self.spinner.stopAnimating()
                case .error(let error):
                    self.showAlert(and: error)
                case .idle:
                    break
                }
            }
        }
        viewModel.getCharacters()
    }
}

extension CharactersController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.characterModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CharactersCell.self)",
                                                            for: indexPath) as? CharactersCell else { return UICollectionViewCell() }
        cell.configureCell(with: viewModel.characterModel[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let characterData = viewModel.characterModel[indexPath.row]
        let coordinator = CharacterDetailCoordinator(navigationController: navigationController ?? UINavigationController(),
                                                     title: characterData.name ?? "No Name",
                                                     url: characterData.url ?? "NO URL")
        coordinator.start()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width / 2 - 22, height: collectionView.frame.height / 2 - 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewModel.paginate(index: indexPath.row)
    }
}
