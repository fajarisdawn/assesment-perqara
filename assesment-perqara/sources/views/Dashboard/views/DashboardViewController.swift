//
//  DashboardViewController.swift
//  assesment-perqara
//
//  Created by fajaradiwasentosa on 14/08/23.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = DashboardViewModel()
    
    init(_ viewModel: DashboardViewModel) {
        super.init(nibName: String(describing: DashboardViewController.self), bundle: nil)
        self.viewModel = viewModel
        viewModel.interactor = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.topItem?.title = "Games For You"
    }
    
}
