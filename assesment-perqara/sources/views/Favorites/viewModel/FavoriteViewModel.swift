//
//  FavoriteViewModel.swift
//  assesment-perqara
//
//  Created by fajaradiwasentosa on 14/08/23.
//

import Foundation

protocol FavoriteViewModelInteractor {
    func fetchedGames()
}

protocol FavoriteViewModelConstructor {
    var games: [GameDetail] { get set }
    func fetchFavorites()
}

class FavoriteViewModel: FavoriteViewModelConstructor {
    var interactor: FavoriteViewModelInteractor?
    var games: [GameDetail] = []
    
    func fetchFavorites() {
        self.games = Storage.fetch(GameDetail.self)
        interactor?.fetchedGames()
    }
}
