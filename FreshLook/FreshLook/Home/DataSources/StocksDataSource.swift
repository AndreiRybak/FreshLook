//
//  StocksDataSource.swift
//  FreshLook
//
//  Created by Andrei Rybak on 6/14/20.
//  Copyright © 2020 Andrei Rybak. All rights reserved.
//

import Foundation
import UIKit

class StocksDataSource {

    let stocks = [StockCellViewModel(stockName: "Приведи друга", stockDescription: "1. Вы являетесь клиентом FreshLook;\n2. Вы приводите нового клиента к нам и он совершает заказ;\n3. Ваш следующий заказ будет иметь скидку в размере 10%.\n", image: UIImage(named: "stockImage") ?? UIImage())]

    var numberOfItems: Int {
        return stocks.count
    }

    func viewModel(at index: Int) -> StockCellViewModel? {
        guard index < stocks.count else {
            return nil
        }
        return stocks[index]
    }
}
