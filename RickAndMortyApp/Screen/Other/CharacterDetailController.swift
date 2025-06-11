//
//  CharacterDetailController.swift
//  RickAndMortyApp
//
//  Created by Mac on 05.06.25.
//

import UIKit

class CharacterDetailController: BaseController {
    private lazy var shareSheet: UIActivityViewController = {
        let share = UIActivityViewController(activityItems: [viewModel.getURL()], applicationActivities: nil)
        return share
    }()
    
    private lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = .init(top: 16, left: 16, bottom: 0, right: 16)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsVerticalScrollIndicator = false
        collection.dataSource = self
        collection.delegate = self
        collection.register(CharacterDetailHeaderView.self,
                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                            withReuseIdentifier: "\(CharacterDetailHeaderView.self)")
        collection.register(CharacterDetailCell.self,
                            forCellWithReuseIdentifier: "\(CharacterDetailCell.self)")
        collection.register(CharacterDetailFooterView.self,
                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                            withReuseIdentifier: "\(CharacterDetailFooterView.self)")
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private let viewModel: CharacterDetailViewModel
    
    init(viewModel: CharacterDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func shareButtonTapped() {
        present(shareSheet, animated: true)
    }
    
    override func configureUI() {
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"),
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(shareButtonTapped))
    }
        
    override func configureConstraints() {
        view.addSubViews(collection, spinner)
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    override func configureViewModel() {
        viewModel.sendState = { [weak self] state in
            guard let self else { return }
            DispatchQueue.main.async {
                switch state {
                case .loading:
                    self.spinner.startAnimating()
                case .loaded:
                    self.spinner.stopAnimating()
                case .success:
                    self.collection.reloadData()
                case .error(let error):
                    self.showAlert(and: error)
                case .idle:
                    break
                }
            }
        }
        viewModel.fetchSingleCharacter()
    }
}

extension CharacterDetailController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CharacterDetailFooterDelegate {    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.characterCellData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CharacterDetailCell.self)",
                                                            for: indexPath) as? CharacterDetailCell else {
            return UICollectionViewCell()
        }
        cell.configureCell(with: viewModel.characterCellData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                               withReuseIdentifier: "\(CharacterDetailHeaderView.self)",
                                                                               for: indexPath) as? CharacterDetailHeaderView else {
                return UICollectionReusableView()
            }
            
            header.configureHeader(with: viewModel.singleCharacter?.image ?? "NO IMAGE")
            
            return header
        case UICollectionView.elementKindSectionFooter:
            guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                               withReuseIdentifier: "\(CharacterDetailFooterView.self)",
                                                                               for: indexPath) as? CharacterDetailFooterView else {
                return UICollectionReusableView()
            }
            footer.delegate = self
            footer.addEpisodes(viewModel.singleCharacter?.episode ?? [])
            return footer
        default:
            assert(false, "Unexpected element kind.")
        }
    }
    
    func didSelectEpisode(at index: Int) {
        let coordinator = EpisodeDetailCoordinator(navigationController: navigationController ?? UINavigationController())
        coordinator.start()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        .init(width: collectionView.frame.width, height: collectionView.frame.height / 2 - 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        .init(width: collectionView.frame.width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width / 2 - 24, height: 150)
    }
}
