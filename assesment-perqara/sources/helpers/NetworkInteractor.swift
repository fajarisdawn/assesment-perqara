//
//  ViewModel.swift
//  assesment-perqara
//
//  Created by fajaradiwasentosa on 14/08/23.
//

import Foundation

protocol NetworkInteractor {
    func success(_ object: Codable,_ network: Network)
    func failed(_ message: String,_ network: Network)
}
