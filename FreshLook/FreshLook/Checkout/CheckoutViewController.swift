//
//  CheckoutViewController.swift
//  FreshLook
//
//  Created by Andrei Rybak on 6/16/20.
//  Copyright © 2020 Andrei Rybak. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    private let services: [Service]

    init(services: [Service]) {
        self.services = services
        let bundle = Bundle(for: CheckoutViewController.self)
        super.init(nibName: String(describing: CheckoutViewController.self), bundle: bundle)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Оформление заказа"
        tableView.register(UINib.init(nibName: "CheckoutTableViewCell", bundle: nil), forCellReuseIdentifier: "checkoutCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

}

extension CheckoutViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "checkoutCell", for: indexPath) as? CheckoutTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(service: services[indexPath.row])
        return cell
    }
}

extension CheckoutViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 348
    }

}
