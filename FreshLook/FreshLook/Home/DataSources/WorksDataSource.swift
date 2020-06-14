//
//  WorksDataSource.swift
//  FreshLook
//
//  Created by Andrei Rybak on 6/14/20.
//  Copyright © 2020 Andrei Rybak. All rights reserved.
//

import Foundation
import UIKit

class WorksDataSource {

    let works = [
        WorkCellViewModel(
            workName: "Комплекс Fresh Nubuck + Покраска",
            workDescription: "- первичная чистка от загрязнений\n- глубокая чистка подошвы\n- чистка \"mid sole\"\n- глубокая машинная чистка ткани верха\n- стирка шнурков\n- удаление катышков\n- покраска\n- сушка",
            image: UIImage(named: "work1") ?? UIImage()),
        WorkCellViewModel(
            workName: "Комплекс Fresh Nubuck + Покраска",
            workDescription: "- первичная чистка от загрязнений\n- глубокая чистка подошвы\n- чистка \"mid sole\"\n- глубокая машинная чистка ткани верха\n- стирка шнурков\n- удаление катышков\n- покраска\n- сушка",
            image: UIImage(named: "work2") ?? UIImage())
    ]

    var numberOfItems: Int {
        return works.count
    }

    func viewModel(at index: Int) -> WorkCellViewModel? {
        guard index < works.count else {
            return nil
        }
        return works[index]
    }
}
