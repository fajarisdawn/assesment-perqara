//
//  NetworkService.swift
//  assesment-perqara
//
//  Created by fajaradiwasentosa on 14/08/23.
//

import Foundation

protocol NetworkServiceInteractor {
    func success(_ object: Codable, network: Network)
    func failed(_ message: String, network: Network)
}

class NetworkService {
    var interactor: NetworkServiceInteractor?
    var dataTask: URLSessionDataTask?
    
    func task<T: Codable>(network: Network, type: T.Type) {
        if let `dataTask` = dataTask {
            if dataTask.state != .running {
                request(network, type: type)
            } else {
                dataTask.cancel()
                request(network, type: type)
            }
        }
        
        request(network, type: type)
    }
    
    private
    func request<T: Codable>(_ network: Network, type: T.Type) {
        let urlString = network.baseUrl.appendingPathComponent(network.path).absoluteString.removingPercentEncoding
        guard let url = URL(string: urlString ?? "") else { return }
        let request = URLRequest(url: url)

        let session = URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
            if let error = error {
                self.interactor?.failed(error.localizedDescription, network: network)
                return
            }
            
            guard let `data` = data else { return }
            let response = NetworkData(data: data)
            
            guard let object = response.decode(type) else {
                self.interactor?.failed("Data can't populate", network: network)
                return
            }
            
            
            self.interactor?.success(object, network: network)
        }
        
        session.resume()
        
    }
}
