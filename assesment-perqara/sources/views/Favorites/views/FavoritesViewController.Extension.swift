//
//  FavoritesViewController.Extension.swift
//  assesment-perqara
//
//  Created by fajaradiwasentosa on 15/08/23.
//

import Foundation
import UIKit

extension FavoritesViewController {
    func configureViews() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerReusableCell(GameCell.self)
        self.tableView.tableFooterView = UIView()
        viewModel.interactor = self
    }
}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: GameCell = tableView.dequeueReusableCell(indexPath: indexPath)
        cell.configureCells(viewModel.games[indexPath.item])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.games[indexPath.item]
        let viewModel = GameViewModel()
        viewModel.id = item.id
        self.navigationController?.pushViewController(GameViewController(viewModel), animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = viewModel.games[indexPath.item]
            viewModel.games.remove(at: indexPath.item)
            Storage.delete("\(item.id)-game")
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension FavoritesViewController: FavoriteViewModelInteractor {
    func fetchedGames() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
