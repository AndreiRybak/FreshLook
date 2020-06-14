//
//  HomeViewController.swift
//  FreshLook
//
//  Created by Andrei Rybak on 6/14/20.
//  Copyright © 2020 Andrei Rybak. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet private weak var stocksCollectionView: UICollectionView!
    private var stocksCollectionViewDataSource: StocksDataSource?
    @IBOutlet private weak var worksCollectionView: UICollectionView!
    private var worksCollectionViewDataSource: WorksDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stocksCollectionView.register(UINib.init(nibName: "StocksCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "stocksCell")
        worksCollectionView.register(UINib.init(nibName: "WorkCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "workCell")

        stocksCollectionViewDataSource = StocksDataSource()
        worksCollectionViewDataSource = WorksDataSource()

        setupStocksCollectionLayout()
        setupWorksCollectionLayout()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .black
    }

    private func setupStocksCollectionLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.stocksCollectionView.collectionViewLayout = layout

        if let layout = self.stocksCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = 8
            layout.itemSize = CGSize(width: self.view.frame.size.width - 32, height: self.stocksCollectionView.frame.height)
            layout.invalidateLayout()
        }
    }

    private func setupWorksCollectionLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.worksCollectionView.collectionViewLayout = layout

        if let layout = self.worksCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = 8
            layout.itemSize = CGSize(width: self.view.frame.size.width * 0.6, height: self.worksCollectionView.frame.height)
            layout.invalidateLayout()
        }
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == stocksCollectionView {
            return stocksCollectionViewDataSource?.numberOfItems ?? 0
        } else if collectionView == worksCollectionView {
            return worksCollectionViewDataSource?.numberOfItems ?? 0
        } else {
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == stocksCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "stocksCell", for: indexPath) as? StocksCollectionViewCell else {
                return UICollectionViewCell()
            }
            if let viewModel = stocksCollectionViewDataSource?.viewModel(at: indexPath.row) {
                cell.configure(viewModel: viewModel)
            }
            return cell
        } else if collectionView == worksCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "workCell", for: indexPath) as? WorkCollectionViewCell else {
                return UICollectionViewCell()
            }
            if let viewModel = worksCollectionViewDataSource?.viewModel(at: indexPath.row) {
                cell.configure(viewModel: viewModel)
            }
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == stocksCollectionView {
            guard let viewModel = stocksCollectionViewDataSource?.viewModel(at: indexPath.row) else {
                return
            }
            self.navigationController?.pushViewController(StockDetailViewController(viewModel: viewModel), animated: true)
        } else if collectionView == worksCollectionView {
            guard let viewModel = worksCollectionViewDataSource?.viewModel(at: indexPath.row) else {
                return
            }
            self.navigationController?.pushViewController(WorkDetailViewController(viewModel: viewModel), animated: true)
        }
    }
}
