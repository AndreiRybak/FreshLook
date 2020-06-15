//
//  ServicesDataSource.swift
//  FreshLook
//
//  Created by Andrei Rybak on 6/14/20.
//  Copyright © 2020 Andrei Rybak. All rights reserved.
//

import Foundation
import UIKit

class ServicesDataSource: NSObject {

    private var services: [ServiceViewModel]

    let sneakersService = ServiceViewModel(title: "Кроссовки/Кеды", image: UIImage(named: "service1") ?? UIImage(), services: [
        Service(type: ServiceTypeConst.sneakers, title: "Комплекс Look", description: "Ultrices sed volutpat massa enim hac varius sagittis consectetur. Pellentesque mauris sed tempor vitae facilisis hac.", price: 10, isFinalPrice: true),
        Service(type: ServiceTypeConst.sneakers, title: "Комплекс Fresh", description: "Ultrices sed volutpat massa enim hac varius sagittis consectetur. Pellentesque mauris sed tempor vitae facilisis hac.", price: 16, isFinalPrice: true),
        Service(type: ServiceTypeConst.sneakers, title: "Комплекс Fresh+", description: "Ultrices sed volutpat massa enim hac varius sagittis consectetur. Pellentesque mauris sed tempor vitae facilisis hac.", price: 20, isFinalPrice: true),
        Service(type: ServiceTypeConst.sneakers, title: "Комплекс Fresh Nubuck", description: "Ultrices sed volutpat massa enim hac varius sagittis consectetur. Pellentesque mauris sed tempor vitae facilisis hac.", price: 18, isFinalPrice: true),
        Service(type: ServiceTypeConst.sneakers, title: "Комплекс Fresh Nubuck+", description: "Ultrices sed volutpat massa enim hac varius sagittis consectetur. Pellentesque mauris sed tempor vitae facilisis hac.", price: 22, isFinalPrice: true),
        Service(type: ServiceTypeConst.sneakers, title: "Комплекс — чистка + пятновыводка", description: "Ultrices sed volutpat massa enim hac varius sagittis consectetur. Pellentesque mauris sed tempor vitae facilisis hac.", price: 30, isFinalPrice: true),

    ])

    let formalShoesService = ServiceViewModel(title: "Формальная обувь", image: UIImage(named: "service2") ?? UIImage(), services: [
        Service(type: ServiceTypeConst.formalShoes, title: "Lady Stadndard (туфли, балетки)", description: "Ultrices sed volutpat massa enim hac varius sagittis consectetur. Pellentesque mauris sed tempor vitae facilisis hac.", price: 18, isFinalPrice: false),
        Service(type: ServiceTypeConst.formalShoes, title: "Lady Premium (сапоги и тд)", description: "Ultrices sed volutpat massa enim hac varius sagittis consectetur. Pellentesque mauris sed tempor vitae facilisis hac.", price: 27, isFinalPrice: false),
        Service(type: ServiceTypeConst.formalShoes, title: "Man Standard (туфли, лоферы и тд)", description: "Ultrices sed volutpat massa enim hac varius sagittis consectetur. Pellentesque mauris sed tempor vitae facilisis hac.", price: 25, isFinalPrice: false)

    ])

    let winterBootsService = ServiceViewModel(title: "Зимние ботинки", image: UIImage(named: "service3") ?? UIImage(), services: [
        Service(type: ServiceTypeConst.winterBoots, title: "Standard", description: "Ultrices sed volutpat massa enim hac varius sagittis consectetur. Pellentesque mauris sed tempor vitae facilisis hac.", price: 35, isFinalPrice: true),
        Service(type: ServiceTypeConst.winterBoots, title: "Premium (сильные загрязнения)", description: "Ultrices sed volutpat massa enim hac varius sagittis consectetur. Pellentesque mauris sed tempor vitae facilisis hac.", price: 50, isFinalPrice: true)

    ])

    let uggService = ServiceViewModel(title: "Угги", image: UIImage(named: "service4") ?? UIImage(), services: [
        Service(type: ServiceTypeConst.ugg, title: "Standard", description: "Ultrices sed volutpat massa enim hac varius sagittis consectetur. Pellentesque mauris sed tempor vitae facilisis hac.", price: 30, isFinalPrice: true),
        Service(type: ServiceTypeConst.ugg, title: "Standard+", description: "Ultrices sed volutpat massa enim hac varius sagittis consectetur. Pellentesque mauris sed tempor vitae facilisis hac.", price: 35, isFinalPrice: false),
        Service(type: ServiceTypeConst.ugg, title: "Premium (сильные загрязнения)", description: "Ultrices sed volutpat massa enim hac varius sagittis consectetur. Pellentesque mauris sed tempor vitae facilisis hac.", price: 50, isFinalPrice: true)

    ])

    override init() {
        services = [sneakersService, formalShoesService, winterBootsService, uggService]
        super.init()
    }


    var numberOfItems: Int {
        return services.count
    }

    func viewModel(at index: Int) -> ServiceViewModel? {
        guard index < services.count else {
            return nil
        }
        return services[index]
    }

}
