//
//  StocksCollectionViewCell.swift
//  FreshLook
//
//  Created by Andrei Rybak on 6/14/20.
//  Copyright © 2020 Andrei Rybak. All rights reserved.
//

import UIKit

class StocksCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }

    func configure(viewModel: StockCellViewModel) {
        imageView.image = viewModel.image
    }

}
