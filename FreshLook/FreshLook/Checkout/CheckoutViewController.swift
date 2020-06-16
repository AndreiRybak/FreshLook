//
//  CheckoutViewController.swift
//  FreshLook
//
//  Created by Andrei Rybak on 6/16/20.
//  Copyright © 2020 Andrei Rybak. All rights reserved.
//

import UIKit

protocol CheckoutCellDelegate: class {
    func typeButtonWasPressed(service: Service, completion: @escaping (String?) -> Void)
    func materialButtonWasPressed(service: Service, completion:  @escaping (String?) -> Void)
    func addPhotoButtonWasPressed(service: Service, completion: () -> Void)
}

class CheckoutViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    private let services: [Service]

    init(services: [Service]) {
        self.services = services
        let bundle = Bundle(for: CheckoutViewController.self)
        super.init(nibName: String(describing: CheckoutViewController.self), bundle: bundle)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Оформление заказа"
        tableView.register(UINib.init(nibName: "CheckoutTableViewCell", bundle: nil), forCellReuseIdentifier: "checkoutCell")
        let nextButton = UIBarButtonItem(title: "Далее", style: .plain, target: self, action: #selector(nextButtonTapped))
        nextButton.tintColor = .black
        navigationItem.rightBarButtonItem = nextButton
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @objc private func nextButtonTapped() {
        print()
    }
}

extension CheckoutViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "checkoutCell", for: indexPath) as? CheckoutTableViewCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        cell.configure(service: services[indexPath.row])
        return cell
    }
}

extension CheckoutViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 348
    }
}

extension CheckoutViewController: CheckoutCellDelegate {
    func typeButtonWasPressed(service: Service, completion: @escaping (String?) -> Void) {
        let actionSheet = UIAlertController(title: "Тип обуви", message: "Выберите тип обуви", preferredStyle: .actionSheet)
        let firstAction = UIAlertAction(title: "Кроссовки", style: .default) { _ in
            completion("Кроссовки")
        }
        let secondAction = UIAlertAction(title: "Кеды", style: .default) { _ in
            completion("Кеды")
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .destructive) { _ in
            completion(nil)
        }
        actionSheet.addAction(firstAction)
        actionSheet.addAction(secondAction)
        actionSheet.addAction(cancelAction)
        self.present(actionSheet, animated: true, completion: nil)
    }

    func materialButtonWasPressed(service: Service, completion:  @escaping (String?) -> Void) {
        let actionSheet = UIAlertController(title: "Тип обуви", message: "Выберите тип обуви", preferredStyle: .actionSheet)
        let firstAction = UIAlertAction(title: "Замша", style: .default) { _ in
            completion("Замша")
        }
        let secondAction = UIAlertAction(title: "Кожа", style: .default) { _ in
            completion("Кожа")
        }
        let thirdAction = UIAlertAction(title: "Ткань", style: .default) { _ in
            completion("Ткань")
        }
        let fourthAction = UIAlertAction(title: "Нубук", style: .default) { _ in
            completion("Нубук")
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .destructive) { _ in
            completion(nil)
        }
        actionSheet.addAction(firstAction)
        actionSheet.addAction(secondAction)
        actionSheet.addAction(thirdAction)
        actionSheet.addAction(fourthAction)
        actionSheet.addAction(cancelAction)
        self.present(actionSheet, animated: true, completion: nil)
    }

    func addPhotoButtonWasPressed(service: Service, completion: () -> Void) {

    }


}
