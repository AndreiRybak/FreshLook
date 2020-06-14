//
//  StockDetailViewController.swift
//  FreshLook
//
//  Created by Andrei Rybak on 6/14/20.
//  Copyright © 2020 Andrei Rybak. All rights reserved.
//

import UIKit

class StockDetailViewController: UIViewController {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var orderButton: UIButton!
    
    private var viewModel: StockCellViewModel

    init(viewModel: StockCellViewModel) {
        self.viewModel = viewModel
        let bundle = Bundle(for: StockDetailViewController.self)
        super.init(nibName: String(describing: StockDetailViewController.self), bundle: bundle)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.title = "Акции"
        bindWithViewModel()
    }

    private func bindWithViewModel() {
        titleLabel.text = viewModel.stockName
        imageView.image = viewModel.image
        descriptionLabel.text = viewModel.stockDescription
    }
    @IBAction func orderButtonWasPressed(_ sender: Any) {
    }
}
