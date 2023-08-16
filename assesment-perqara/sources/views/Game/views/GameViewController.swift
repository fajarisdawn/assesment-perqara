//
//  GameViewController.swift
//  assesment-perqara
//
//  Created by fajaradiwasentosa on 15/08/23.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var playedLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var viewModel = GameViewModel()
    
    init(_ viewModel: GameViewModel) {
        super.init(nibName: String(describing: GameViewController.self), bundle: nil)
        self.viewModel = viewModel
        viewModel.interactor = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchGame()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.topItem?.title = "Detail"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(favoriteButtonTapped(_:)))
    }
    
    private
    func configureContents() {
        guard let object = viewModel.game else { return }
        gameImageView.loadImageUsingCacheWithUrlString(urlString: object.backgroundImage)
        playedLabel.text = "\(object.playtime) played"
        releaseLabel.text = "Release date \(object.released)"
        ratingLabel.text = String(describing: object.rating)
        descriptionLabel.text = object.descriptionRaw
        titleLabel.text = object.nameOriginal
        genreLabel.text = object.developers.first?.name ?? ""
    }
    
    
    @objc func favoriteButtonTapped(_ sender: UIButton) {
        guard let game = viewModel.game else { return }
        Storage.save(game, name: "\(game.id)-game")
        let alertController = UIAlertController(title: "Added to favorite", message: "", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) {
            (action: UIAlertAction!) in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension GameViewController: NetworkInteractor {
    func success(_ object: Codable, _ network: Network) {
        DispatchQueue.main.async {
            self.configureContents()
        }
        
    }
    
    func failed(_ message: String, _ network: Network) {
        print(message)
    }
    
    
}
