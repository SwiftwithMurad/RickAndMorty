//
//  BaseController.swift
//  RickAndMortyApp
//
//  Created by Mac on 02.06.25.
//

import UIKit

class BaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            
        configureUI()
        configureConstraints()
        configureViewModel()
    }
    
    func configureUI() {}
    func configureConstraints() {}
    func configureViewModel() {}
}
