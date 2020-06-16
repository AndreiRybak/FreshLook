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
    @IBOutlet private weak var typeLabel: UILabel!
    @IBOutlet private weak var materialLabel: UILabel!

    private var service: Service?

    weak var delegate: CheckoutCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(service: Service) {
        self.service = service
        serviceTitleLabel.text = service.title
    }

    @IBAction func typeButtonWasPressed(_ sender: Any) {
        guard let service = service else {
            return
        }
        delegate?.typeButtonWasPressed(service: service, completion: { [weak self] text in
            guard let text = text else {
                self?.typeLabel.text = "Выберите тип обуви"
                self?.typeLabel.textColor = UIColor(red: 183 / 255, green: 183 / 255, blue: 183 / 255, alpha: 1)
                return
            }
            self?.typeLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
            self?.typeLabel.text = text
        })
    }

    @IBAction func materialButtonWasPressed(_ sender: Any) {
        guard let service = service else {
            return
        }
        delegate?.materialButtonWasPressed(service: service, completion: { [weak self] text in
            guard let text = text else {
                self?.materialLabel.text = "Выберите материал обуви"
                self?.materialLabel.textColor = UIColor(red: 183 / 255, green: 183 / 255, blue: 183 / 255, alpha: 1)
                return
            }
            self?.materialLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
            self?.materialLabel.text = text
        })
    }

    @IBAction func addPhotoButtonWasPressed(_ sender: Any) {
    }

}
