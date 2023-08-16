//
//  DashboardViewController.Extension.swift
//  assesment-perqara
//
//  Created by fajaradiwasentosa on 15/08/23.
//

import Foundation
import UIKit

extension DashboardViewController {
    func configureView() {
        self.searchBar.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerReusableCell(GameCell.self)
        self.tableView.registerReusableCell(IndicatorTableViewCell.self)
        self.tableView.tableFooterView = UIView()
        
        navigationController?.navigationBar.topItem?.title = "Games For You"
        viewModel.fetchGames()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if (offsetY > (contentHeight) - scrollView.frame.height * 4) && !viewModel.isFetching && !viewModel.isSearching {
            viewModel.fetchGames()
        }
    }
}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return viewModel.games.count
        } else if section == 1 {
            return 1
        } else {
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell: GameCell = tableView.dequeueReusableCell(indexPath: indexPath)
            cell.configureCells(viewModel.games[indexPath.item])
            return cell
        }
        
        if !viewModel.isSearching {
            let cell: IndicatorTableViewCell = tableView.dequeueReusableCell(indexPath: indexPath)
            if viewModel.isFetching {
                cell.indicatorView.startAnimating()
            } else {
                cell.indicatorView.stopAnimating()
            }
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.games[indexPath.item]
        let viewModel = GameViewModel()
        viewModel.id = item.id
        self.navigationController?.pushViewController(GameViewController(viewModel), animated: true)
    }
}

extension DashboardViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let value = searchBar.text else { return }
        print("value: ", value)
        print("text: ", searchText)
        self.viewModel.searchText = value
        if value.isEmpty || value == "" {
            self.viewModel.games = []
            self.viewModel.isSearching = false
            self.viewModel.fetchGames()
        } else {
            self.viewModel.fetchSearchGames()
        }
    }
}

extension DashboardViewController: NetworkInteractor {
    func failed(_ message: String, _ network: Network) {
        print("error mesage: ", message)
        DispatchQueue.main.async {
            self.viewModel.isFetching = false
            self.tableView.reloadSections(IndexSet(integer: 1), with: .automatic)
        }
    }
    
    func success(_ object: Codable, _ network: Network) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

