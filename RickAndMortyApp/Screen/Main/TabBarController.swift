//
//  TabBarController.swift
//  RickAndMortyApp
//
//  Created by Mac on 02.06.25.
//

import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureControllers()
    }
    
    private func configureControllers() {
        let firstVC = UINavigationController(rootViewController: CharactersController())
        firstVC.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person"), tag: 1)
        
        let secondVC = UINavigationController(rootViewController: LocationsController())
        secondVC.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "location"), tag: 2)
        
        let thirdVC = UINavigationController(rootViewController: EpisodesController())
        thirdVC.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "tv"), tag: 3)
        
        let fourthVC = UINavigationController(rootViewController: SettingsController())
        fourthVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 4)
                
        viewControllers = [firstVC, secondVC, thirdVC, fourthVC]
    }
}
