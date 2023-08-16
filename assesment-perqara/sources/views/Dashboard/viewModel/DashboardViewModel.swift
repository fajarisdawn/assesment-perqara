//
//  DashboardViewModel.swift
//  assesment-perqara
//
//  Created by fajaradiwasentosa on 14/08/23.
//

import Foundation

protocol DashboardViewModelConstructor {
    var page: Int { get set }
    var games: [Result] { get set }
    var isFetching: Bool { get set }
    var isSearching: Bool { get set }
    var searchText: String { get set }
    func fetchGames()
    func fetchSearchGames()
}

class DashboardViewModel: NetworkDomain, DashboardViewModelConstructor {
    var networkService = NetworkService()
    var interactor: NetworkInteractor?
    var page: Int = 1
    var isFetching: Bool = false
    var isSearching: Bool = false
    var searchText: String = ""
    var games: [Result] = []
    
    init() {
        self.networkService.interactor = self
    }
    
    func fetchGames() {
        self.isFetching = true
        DispatchQueue.global().async {
            if self.isFetching { 
                sleep(3)
                self.getGames(page: self.page)
            }
        }
    }
    
    func fetchSearchGames() {
        DispatchQueue.global().async {
            if !self.isSearching {
                self.games = []
                self.page = 1
                self.isFetching = true
                self.isSearching = true
                self.searchGames(query: self.searchText)
            }
        }
        
    }
}

extension DashboardViewModel: NetworkServiceInteractor {
    func success(_ object: Codable, network: Network) {
        guard let `object` = object as? Game else {
            interactor?.failed("failed populate data", network)
            return
        }
        
        if isSearching {
            self.games = object.results
        } else {
            isFetching = false
            page += 1
            self.games.append(contentsOf: object.results)
        }
        
        interactor?.success(object, network)
    }
    
    func failed(_ message: String, network: Network) {
        isFetching = false
        interactor?.failed(message, network)
    }
    
}


