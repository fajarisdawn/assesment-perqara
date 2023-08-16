//
//  Network.swift
//  assesment-perqara
//
//  Created by fajaradiwasentosa on 14/08/23.
//

import Foundation

protocol EndpointType {
    var baseUrl: URL { get }
    var apiKey: String { get }
    var path: String { get }
}

enum Network {
    case none
    case games(page: Int)
    case game(id: Int)
    case searchGames(query: String)
}

extension Network: EndpointType {
    var apiKey: String {
        return "9314188e009649608cf31eb4a75d9ec0"
    }
    
    var baseUrl: URL {
        return URL(string: "https://api.rawg.io/api/")!
    }
    
    var path: String {
        switch self {
            case .games(let page):
                return "games?page=\(page)&page_size=5&key=\(apiKey)"
            case .game(let id):
                return "games/\(id)?key=\(apiKey)"
            case .searchGames(let query):
                return "games?search=\(query)&key=\(apiKey)"
            default:
                return ""
        }
    }
}
