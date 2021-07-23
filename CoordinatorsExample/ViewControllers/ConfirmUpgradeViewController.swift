//
//  ConfirmUpgradeViewController.swift
//  CoordinatorsExample
//
//  Created by Griffin Storback on 2021-07-22.
//

import UIKit

class ConfirmUpgradeViewController: UIViewController {
    
    var coordinator: Coordinator?
    
    let confirmUpgradePurchaseButton: UIButton
    
    init() {
        confirmUpgradePurchaseButton = UIButton()
        
        super.init(nibName: nil, bundle: nil)
        
        layoutViews()
    }
    
    private func layoutViews() {
        view.addSubview(confirmUpgradePurchaseButton)
        confirmUpgradePurchaseButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            confirmUpgradePurchaseButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            confirmUpgradePurchaseButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            confirmUpgradePurchaseButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            confirmUpgradePurchaseButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Confirm upgrade"
        view.backgroundColor = .systemPink
        
        confirmUpgradePurchaseButton.backgroundColor = UIColor.systemGray.withAlphaComponent(0.5)
        confirmUpgradePurchaseButton.layer.cornerRadius = 15
        confirmUpgradePurchaseButton.addTarget(self, action: #selector(confirmUpgradePurchaseButtonPressed), for: .touchUpInside)
    }
    
    @objc func confirmUpgradePurchaseButtonPressed() {
        
    }
}
