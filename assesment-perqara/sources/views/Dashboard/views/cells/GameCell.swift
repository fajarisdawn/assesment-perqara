//
//  GameCell.swift
//  assesment-perqara
//
//  Created by fajaradiwasentosa on 15/08/23.
//

import UIKit

class GameCell: UITableViewCell {

    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var gameSubTitleLabel: UILabel!
    @IBOutlet weak var gameTitleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCells(_ object: Result) {
        gameTitleLabel.text = object.name
        gameSubTitleLabel.text = "Release date \(object.released)"
        ratingLabel.text = String(describing: object.rating)
        gameImageView.layer.cornerRadius = 5
        gameImageView.loadImageUsingCacheWithUrlString(urlString: object.backgroundImage)
    }
    
    func configureCells(_ object: GameDetail) {
        gameTitleLabel.text = object.name
        gameSubTitleLabel.text = "Release date \(object.released)"
        ratingLabel.text = String(describing: object.rating)
        gameImageView.layer.cornerRadius = 5
        gameImageView.loadImageUsingCacheWithUrlString(urlString: object.backgroundImage)
    }
}

extension GameCell: ReusableCell {}
