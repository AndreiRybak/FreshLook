//
//  ServiceViewModel.swift
//  FreshLook
//
//  Created by Andrei Rybak on 6/14/20.
//  Copyright © 2020 Andrei Rybak. All rights reserved.
//

import Foundation
import UIKit

public enum ServiceTypeConst {
    static let sneakers = "sneakers"
    static let formalShoes = "formalShoes"
    static let winterBoots = "winterBoots"
    static let ugg = "ugg"
}

struct Service: Codable {
    var type: String
    var title: String
    var description: String
    var price: Double
    var isFinalPrice: Bool
}

class ServiceViewModel {
    var title: String
    var image: UIImage
    var services: [Service]

    init(title: String, image: UIImage, services: [Service]) {
        self.title = title
        self.image = image
        self.services = services
    }
}
