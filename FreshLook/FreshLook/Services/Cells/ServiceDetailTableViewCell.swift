//
//  ServiceDetailTableViewCell.swift
//  FreshLook
//
//  Created by Andrei Rybak on 6/14/20.
//  Copyright © 2020 Andrei Rybak. All rights reserved.
//

import UIKit

class ServiceDetailTableViewCell: UITableViewCell {

    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

    private var service: Service?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = ""
        priceLabel.text = ""
        descriptionLabel.text = ""
    }

    func configure(service: Service) {
        self.service = service

        title.text = service.title
        if service.isFinalPrice {
            priceLabel.text = "\(Int(service.price)) р."
        } else {
            priceLabel.text = "от \(Int(service.price)) р."
        }
        descriptionLabel.text = service.description
    }

    @IBAction func addToBasketButtonPressed(_ sender: Any) {
        guard let service = service else {
            return
        }
        UserDefaults.standard.save(services: [service])
    }

}
