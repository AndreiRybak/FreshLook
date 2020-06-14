//
//  WorkCellViewModel.swift
//  FreshLook
//
//  Created by Andrei Rybak on 6/14/20.
//  Copyright © 2020 Andrei Rybak. All rights reserved.
//

import Foundation
import UIKit

class WorkCellViewModel {
    var workName: String
    var workDescription: String
    var image: UIImage

    init(workName: String, workDescription: String, image: UIImage) {
        self.workName = workName
        self.workDescription = workDescription
        self.image = image
    }
}
