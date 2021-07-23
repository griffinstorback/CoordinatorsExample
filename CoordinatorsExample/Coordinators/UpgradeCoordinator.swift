//
//  UpgradeCoordinator.swift
//  CoordinatorsExample
//
//  Created by Griffin Storback on 2021-07-22.
//

import Foundation
import UIKit

class UpgradeCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let upgradeVC = UpgradeViewController()
        upgradeVC.coordinator = self
        navigationController.pushViewController(upgradeVC, animated: true)
    }
    
    func purchaseNow() {
        let confirmUpgradeVC = ConfirmUpgradeViewController()
        confirmUpgradeVC.coordinator = self
        navigationController.pushViewController(confirmUpgradeVC, animated: true)
    }
}

extension UpgradeCoordinator: Login {
    func login() {
        let loginVC = LoginViewController()
        loginVC.coordinator = self
        navigationController.pushViewController(loginVC, animated: true)
    }
}
