//
//  ServiceDetailViewController.swift
//  FreshLook
//
//  Created by Andrei Rybak on 6/14/20.
//  Copyright © 2020 Andrei Rybak. All rights reserved.
//

import UIKit

class ServiceDetailViewController: UIViewController {

    private let viewModel: ServiceViewModel
    @IBOutlet private weak var tableView: UITableView!
    
    init(viewModel: ServiceViewModel) {
        self.viewModel = viewModel
        let bundle = Bundle(for: ServiceDetailViewController.self)
        super.init(nibName: String(describing: ServiceDetailViewController.self), bundle: bundle)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = viewModel.title
        tableView.register(UINib.init(nibName: "ServiceDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "detailServiceCell")
    }
}

extension ServiceDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.services.count
    }
}

extension ServiceDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailServiceCell", for: indexPath) as? ServiceDetailTableViewCell else {
            return UITableViewCell()
        }
        let service = viewModel.services[indexPath.row]
        cell.configure(service: service)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 118
    }
}
