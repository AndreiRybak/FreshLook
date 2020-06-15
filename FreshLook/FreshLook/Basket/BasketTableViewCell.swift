//
//  BasketTableViewCell.swift
//  FreshLook
//
//  Created by Andrei Rybak on 6/15/20.
//  Copyright © 2020 Andrei Rybak. All rights reserved.
//

import UIKit

class BasketTableViewCell: UITableViewCell {

    @IBOutlet private weak var serviceTitleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var countLabel: UILabel!

    weak var delegate: BasketCellDelegate?

    private var service: Service?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        serviceTitleLabel.text = ""
        descriptionLabel.text = ""
        priceLabel.text = ""
        countLabel.text = ""
    }

    func configure(service: Service) {
        self.service = service
        serviceTitleLabel.text = service.title
        descriptionLabel.text = service.description
        guard let allServices = UserDefaults.standard.getStoredServices() else {
            countLabel.text = "1"
            priceLabel.text = "\(service.price) р."
            return
        }
        var count = 0
        for basketService in allServices {
            if basketService.type == service.type && basketService.title == service.title {
                count += 1
            }
        }
        countLabel.text = "\(count)"
        let finalPrice = service.price * Double(count)
        priceLabel.text = "\(finalPrice) р."
    }

    @IBAction func deleteButtonWasPressed(_ sender: Any) {
        guard let allServices = UserDefaults.standard.getStoredServices() else {
            return
        }
        let services = allServices.filter { serv -> Bool in
            return service?.type == serv.type && service?.title == serv.title
        }
        UserDefaults.standard.delete(services: services)
        delegate?.actionWasCompleted()
    }

    @IBAction func plusButtonWasPressed(_ sender: Any) {
        guard let service = service else {
            return
        }
        let newService = Service(type: service.type, title: service.title, description: service.description, price: service.price, isFinalPrice: service.isFinalPrice)
        UserDefaults.standard.save(services: [newService])
        configure(service: service)
        delegate?.actionWasCompleted()
    }

    @IBAction func minusButtonWasPressed(_ sender: Any) {
        guard let service = service else {
            return
        }
        UserDefaults.standard.delete(services: [service])
        configure(service: service)
        delegate?.actionWasCompleted()
    }

}
