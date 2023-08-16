//
//  NetworkDomain.swift
//  assesment-perqara
//
//  Created by fajaradiwasentosa on 14/08/23.
//

import Foundation

//
//  Domain.swift
//  weather
//
//  Created by Fajar Adiwa Sentosa on 10/06/22.
//  Copyright © 2022 Fajar Adiwa Sentosa. All rights reserved.
//

import Foundation

protocol NetworkDomain {
    var networkService: NetworkService { get set }
    func getGames(page: Int)
    func getGame(id: Int)
    func searchGames(query: String)
}

extension NetworkDomain {
    
    func getGames(page: Int) {
        networkService.task(network: .games(page: page), type: Game.self)
    }
    
    func getGame(id: Int) {
        networkService.task(network: .game(id: id), type: GameDetail.self)
    }
    
    func searchGames(query: String) {
        networkService.task(network: .searchGames(query: query), type: Game.self)
    }
    
}



