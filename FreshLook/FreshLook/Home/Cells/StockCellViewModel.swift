//
//  StockCellViewModel.swift
//  FreshLook
//
//  Created by Andrei Rybak on 6/14/20.
//  Copyright © 2020 Andrei Rybak. All rights reserved.
//

import Foundation
import UIKit

class StockCellViewModel {
    var stockName: String
    var stockDescription: String
    var image: UIImage

    init(stockName: String, stockDescription: String, image: UIImage) {
        self.stockName = stockName
        self.stockDescription = stockDescription
        self.image = image
    }
}
