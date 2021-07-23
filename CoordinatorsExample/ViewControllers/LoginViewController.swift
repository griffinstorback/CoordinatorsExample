//
//  LoginViewController.swift
//  CoordinatorsExample
//
//  Created by Griffin Storback on 2021-07-21.
//

import UIKit

class LoginViewController: UIViewController {
    
    weak var coordinator: Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Login / Sign-up"
        view.backgroundColor = .systemYellow
    }
}
