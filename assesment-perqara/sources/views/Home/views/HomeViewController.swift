//
//  HomeViewController.swift
//  assesment-perqara
//
//  Created by fajaradiwasentosa on 14/08/23.
//

import UIKit

class HomeViewController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureViews()
    }
    
    private
    func configureViews() {
        let dashboardViewModel = DashboardViewModel()
        let viewControllers = [DashboardViewController(dashboardViewModel), FavoritesViewController()]
        self.viewControllers = viewControllers
        
        self.tabBar.items![0].title = "Home"
        self.tabBar.items![0].image = UIImage.init(systemName: "house")
        self.tabBar.items![1].title = "Favorites"
        self.tabBar.items![1].image = UIImage.init(systemName: "heart")
    }
}
