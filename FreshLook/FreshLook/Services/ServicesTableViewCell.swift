//
//  ServicesTableViewCell.swift
//  FreshLook
//
//  Created by Andrei Rybak on 6/14/20.
//  Copyright © 2020 Andrei Rybak. All rights reserved.
//

import UIKit

class ServicesTableViewCell: UITableViewCell {

    @IBOutlet private weak var serviceLogoImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.layer.cornerRadius = 4
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        serviceLogoImageView.image = nil
        titleLabel.text = ""
    }

    func configure(viewModel: ServiceViewModel) {
        serviceLogoImageView.image = viewModel.image
        titleLabel.text = viewModel.title
    }
}
