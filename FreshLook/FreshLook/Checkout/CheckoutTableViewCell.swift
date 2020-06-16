//
//  CheckoutTableViewCell.swift
//  FreshLook
//
//  Created by Andrei Rybak on 6/16/20.
//  Copyright © 2020 Andrei Rybak. All rights reserved.
//

import UIKit

class CheckoutTableViewCell: UITableViewCell {

    @IBOutlet private weak var serviceTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(service: Service) {
        serviceTitleLabel.text = service.title
    }

}
