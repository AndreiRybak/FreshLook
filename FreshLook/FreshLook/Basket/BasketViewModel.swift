//
//  BasketViewModel.swift
//  FreshLook
//
//  Created by Andrei Rybak on 6/15/20.
//  Copyright © 2020 Andrei Rybak. All rights reserved.
//

import Foundation

class BasketViewModel {

    private func uniqBasketServices() -> [Service] {
        guard let basketServices = UserDefaults.standard.getStoredServices() else {
            return []
        }
        var uniqServices: [Service] = []

        for basketService in basketServices {
            if !uniqServices.contains(where: { uniqService -> Bool in
                return uniqService.type == basketService.type && uniqService.title == basketService.title
            }) {
                uniqServices.append(basketService)
            }
        }
        return uniqServices
    }

    var numberOfItems: Int {
        return uniqBasketServices().count
    }

    func service(at index: Int) -> Service? {
        if index < uniqBasketServices().count {
            return uniqBasketServices()[index]
        } else {
            return nil
        }
    }
}
