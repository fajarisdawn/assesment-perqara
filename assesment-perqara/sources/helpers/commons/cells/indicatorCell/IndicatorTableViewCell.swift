//
//  IndicatorTableViewCell.swift
//  assesment-perqara
//
//  Created by fajaradiwasentosa on 16/08/23.
//

import UIKit

class IndicatorTableViewCell: UITableViewCell {

    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        indicatorView.hidesWhenStopped = true
    }
}

extension IndicatorTableViewCell: ReusableCell {}
