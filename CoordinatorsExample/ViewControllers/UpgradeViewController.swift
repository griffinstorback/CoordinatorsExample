//
//  UpgradeViewController.swift
//  CoordinatorsExample
//
//  Created by Griffin Storback on 2021-07-21.
//

import UIKit

class UpgradeViewController: UIViewController {
    
    weak var coordinator: UpgradeCoordinator?
    
    let loginButton: UIButton
    let purchaseNowButton: UIButton
    
    init() {
        loginButton = UIButton()
        purchaseNowButton = UIButton()
        
        super.init(nibName: nil, bundle: nil)
        
        layoutViews()
    }
    
    private func layoutViews() {
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        view.addSubview(purchaseNowButton)
        purchaseNowButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            purchaseNowButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10),
            purchaseNowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            purchaseNowButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            purchaseNowButton.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Upgrade"
        view.backgroundColor = .systemBlue
        
        loginButton.setTitle("Login first", for: .normal)
        loginButton.backgroundColor = .systemTeal
        loginButton.layer.cornerRadius = 15
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        
        purchaseNowButton.setTitle("Purchase now", for: .normal)
        purchaseNowButton.backgroundColor = .systemOrange
        purchaseNowButton.layer.cornerRadius = 15
        purchaseNowButton.addTarget(self, action: #selector(purchaseNowButtonPressed), for: .touchUpInside)
    }
    
    @objc func loginButtonPressed() {
        coordinator?.login()
    }
    
    @objc func purchaseNowButtonPressed() {
        coordinator?.purchaseNow()
    }
}
