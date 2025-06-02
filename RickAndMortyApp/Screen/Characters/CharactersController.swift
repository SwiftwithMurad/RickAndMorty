//
//  CharactersController.swift
//  RickAndMortyApp
//
//  Created by Mac on 02.06.25.
//

import UIKit

final class CharactersController: BaseController {
    private lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private let viewModel = CharactersViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()       
    }
    
    override func configureUI() {
        handleTitle(with: "Characters")
        view.backgroundColor = .systemBackground
        spinner.startAnimating()
    }
    
    override func configureViewModel() {
        viewModel.getCharacters()
    }
}
