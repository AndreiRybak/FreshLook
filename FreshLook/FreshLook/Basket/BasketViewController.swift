//
//  BasketViewController.swift
//  FreshLook
//
//  Created by Andrei Rybak on 6/15/20.
//  Copyright © 2020 Andrei Rybak. All rights reserved.
//

import Foundation
import UIKit

protocol BasketCellDelegate: class {
    func actionWasCompleted()
}

class BasketViewController: UIViewController {

    @IBOutlet private weak var emptyStateView: UIView!
    @IBOutlet private weak var emptyStateGoToServicesButton: UIButton!
    
    @IBOutlet private weak var preFinalPriceLabel: UILabel!
    @IBOutlet private weak var finalPriceLabel: UILabel!

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var priceView: UIView!
    @IBOutlet private weak var orderButton: UIButton!
    @IBOutlet private weak var basketLogo: UIImageView!
    
    private var viewModel = BasketViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Корзина"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .black
        emptyStateGoToServicesButton.layer.borderWidth = 1
        emptyStateGoToServicesButton.layer.borderColor = UIColor(red: 68 / 255, green: 146 / 255, blue: 151 / 255, alpha: 1).cgColor
        tableView.register(UINib.init(nibName: "BasketTableViewCell", bundle: nil), forCellReuseIdentifier: "basketCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateState()
    }

    private func updateState() {
        if viewModel.numberOfItems == 0 {
            setEmptyState()
        } else {
            setIsNotEmptyState()
            tableView.reloadData()
        }
    }

    private func setEmptyState() {
        emptyStateView.isHidden = false
        tableView.isHidden = true
        priceView.isHidden = true
        orderButton.isHidden = true
        basketLogo.isHidden = true
    }

    private func setIsNotEmptyState() {
        emptyStateView.isHidden = true
        tableView.isHidden = false
        priceView.isHidden = false
        orderButton.isHidden = false
        basketLogo.isHidden = false
        guard let allServices = UserDefaults.standard.getStoredServices() else {
            preFinalPriceLabel.text = "0"
            finalPriceLabel.text = "0"
            return
        }
        var finalPrice = 0.0
        for service in allServices {
            finalPrice += service.price
        }
        preFinalPriceLabel.text = "\(finalPrice) р."
        finalPriceLabel.text = "\(finalPrice) р."
    }

    @IBAction func orderButtonWasPressed(_ sender: Any) {
        guard let allServices = UserDefaults.standard.getStoredServices() else {
            return
        }
        let checkoutViewController = CheckoutViewController(services: allServices)
        navigationController?.pushViewController(checkoutViewController, animated: true)
    }

    @IBAction func goToServicesButtonPressed(_ sender: Any) {
        tabBarController?.selectedIndex = 1
    }
}

extension BasketViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "basketCell", for: indexPath) as? BasketTableViewCell, let service = viewModel.service(at: indexPath.row) else {
            return UITableViewCell()
        }
        cell.delegate = self
        cell.configure(service: service)
        return cell
    }
}

extension BasketViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 129
    }

}

extension BasketViewController: BasketCellDelegate {
    func actionWasCompleted() {
        tableView.reloadData()
        updateState()
    }
}
