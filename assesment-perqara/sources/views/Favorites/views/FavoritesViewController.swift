//
//  FavoritesViewController.swift
//  assesment-perqara
//
//  Created by fajaradiwasentosa on 14/08/23.
//

import UIKit

class FavoritesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = FavoriteViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.topItem?.title = "Favorite Games"
        viewModel.fetchFavorites()
    }
    
}
