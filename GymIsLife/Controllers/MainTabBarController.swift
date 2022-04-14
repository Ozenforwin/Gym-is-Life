//
//  MainTabBarController.swift
//  GymIsLife
//
//  Created by Dyadichev on 14.04.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupItems()
    }
    
    private func setupTabBar() {
        tabBar.backgroundColor = .specialTabBar
        tabBar.tintColor = .specialDarkGreen
        tabBar.unselectedItemTintColor = .specialGray
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.specialLightBrown.cgColor
    }
    
    private func setupItems() {
        
        let mainViewController = MainViewController()
        let statisticViewController = StatisticController()
        let profileViewController = ProfileViewController()
        
        setViewControllers([mainViewController,statisticViewController,profileViewController], animated: true)
        
        guard let items = tabBar.items else { return }
        
        items[0].title = "Main"
        items[1].title = "Statistic"
        items[2].title = "Profile"
        
        items[0].image = UIImage(named: "Tabbarmain")
        items[1].image = UIImage(named: "Tabbarstatistic")
        items[2].image = UIImage(named: "Tabbarprofile")
        
    }
}
