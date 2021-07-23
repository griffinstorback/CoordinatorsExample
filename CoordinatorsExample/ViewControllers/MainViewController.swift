//
//  ViewController.swift
//  CoordinatorsExample
//
//  Created by Griffin Storback on 2021-07-20.
//

import UIKit

class MainViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    
    let loginButton: UIButton
    let upgradeButton: UIButton

    override func viewDidLoad() {
        print("ViewController viewDidLoad")
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray
        title = "Main"
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .systemGray2
        loginButton.layer.cornerRadius = 15
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        upgradeButton.setTitle("Upgrade", for: .normal)
        upgradeButton.backgroundColor = .systemGray4
        upgradeButton.layer.cornerRadius = 15
        upgradeButton.addTarget(self, action: #selector(upgradeButtonTapped), for: .touchUpInside)
    }

    init() {
        print("ViewController init")
        
        loginButton = UIButton()
        upgradeButton = UIButton()
        
        super.init(nibName: nil, bundle: nil)
        
        layoutViews()
    }
    
    private func layoutViews() {
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            loginButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            loginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            loginButton.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        view.addSubview(upgradeButton)
        upgradeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            upgradeButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10),
            upgradeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            upgradeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            upgradeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func loginButtonTapped() {
        coordinator?.login()
    }
    
    @objc func upgradeButtonTapped() {
        coordinator?.upgrade()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

