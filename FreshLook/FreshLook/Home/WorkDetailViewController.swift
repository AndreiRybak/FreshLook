//
//  WorkDetailViewController.swift
//  FreshLook
//
//  Created by Andrei Rybak on 6/14/20.
//  Copyright © 2020 Andrei Rybak. All rights reserved.
//

import UIKit

class WorkDetailViewController: UIViewController {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    private var viewModel: WorkCellViewModel

    init(viewModel: WorkCellViewModel) {
        self.viewModel = viewModel
        let bundle = Bundle(for: WorkDetailViewController.self)
        super.init(nibName: String(describing: WorkDetailViewController.self), bundle: bundle)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.title = "Галерея абот"
        bindWithViewModel()
    }

     private func bindWithViewModel() {
        titleLabel.text = viewModel.workName
        imageView.image = viewModel.image
        descriptionLabel.text = viewModel.workDescription
    }

    @IBAction func orderButtonWasPressed(_ sender: Any) {
        self.tabBarController?.selectedIndex = 1
    }
}
