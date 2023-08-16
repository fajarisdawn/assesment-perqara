//
//  Date.Extension.swift
//  assesment-perqara
//
//  Created by fajaradiwasentosa on 14/08/23.
//

import Foundation

extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
    }
}
