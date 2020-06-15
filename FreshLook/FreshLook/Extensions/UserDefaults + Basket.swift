//
//  UserDefaults + Service.swift
//  FreshLook
//
//  Created by Andrei Rybak on 6/15/20.
//  Copyright © 2020 Andrei Rybak. All rights reserved.
//

import Foundation

extension UserDefaults {

    func save(services: [Service]) {
        if var existedServices = getStoredServices() {
            existedServices.append(contentsOf: services)
            UserDefaults.standard.set(try? PropertyListEncoder().encode(existedServices), forKey:"services")
        } else {
            UserDefaults.standard.set(try? PropertyListEncoder().encode(services), forKey:"services")
        }
    }

    func delete(services: [Service]) {
        guard var allServices = UserDefaults.standard.getStoredServices() else {
            return
        }

        for service in services {
            var isRemoved = false
                allServices.removeAll { serv -> Bool in
                guard isRemoved == false else {
                    return false
                }
                if service.type == serv.type && service.title == serv.title {
                    isRemoved = true
                    return true
                } else {
                    return false
                }
            }
        }
        UserDefaults.standard.set(try? PropertyListEncoder().encode(allServices), forKey:"services")
    }

    func getStoredServices() -> [Service]? {
        guard let data = UserDefaults.standard.value(forKey:"services") as? Data,
        let servicesInBasket = try? PropertyListDecoder().decode(Array<Service>.self, from: data) else {
            return nil
        }
        return servicesInBasket
    }

}
