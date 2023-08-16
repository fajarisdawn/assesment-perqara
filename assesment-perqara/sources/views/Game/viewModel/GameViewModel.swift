//
//  GameViewModel.swift
//  assesment-perqara
//
//  Created by fajaradiwasentosa on 15/08/23.
//

import Foundation

protocol GameViewModelConstructor: NetworkDomain {
    var game: GameDetail? { get set }
    func fetchGame()
    var id: Int { get set }
}

class GameViewModel: GameViewModelConstructor {
    
    var networkService = NetworkService()
    var interactor: NetworkInteractor?
    var game: GameDetail? = nil
    var id: Int = 0
    
    func fetchGame() {
        getGame(id: id)
    }
    
    init() {
        networkService.interactor = self
    }
}

extension GameViewModel: NetworkServiceInteractor {
    func success(_ object: Codable, network: Network) {
        guard let `object` = object as? GameDetail else {
            interactor?.failed("Failed populate data", network)
            return
        }
        self.game = object
        interactor?.success(object, network)
    }
    
    func failed(_ message: String, network: Network) {
        interactor?.failed(message, network)
    }
    
    
}
