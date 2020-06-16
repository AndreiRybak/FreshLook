//
//  SignInViewController.swift
//  FreshLook
//
//  Created by Andrei Rybak on 6/16/20.
//  Copyright © 2020 Andrei Rybak. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .clear
    }

    @IBAction func signInButtonWasPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TabBarController")
        UserDefaults.standard.setValue(true, forKey: "isLoggedIn")
        UIApplication.shared.keyWindow?.rootViewController = vc
        UIApplication.shared.keyWindow?.makeKeyAndVisible()
    }
    
}
