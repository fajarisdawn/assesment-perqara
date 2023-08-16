//
//  NetworkData.swift
//  assesment-perqara
//
//  Created by fajaradiwasentosa on 14/08/23.
//

import Foundation

struct NetworkData {
    fileprivate var data: Data
    
    init(data: Data) {
        self.data = data
    }
}

extension NetworkData {
    public func decode<T: Codable>(_ type: T.Type) -> T? {
        let jsonDecoder = JSONDecoder()
        do {
            let response = try jsonDecoder.decode(T.self, from: data)
            return response
        } catch {
            return nil
        }
    }
}
