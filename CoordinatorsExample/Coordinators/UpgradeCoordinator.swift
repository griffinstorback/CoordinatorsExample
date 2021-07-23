//
//  UpgradeCoordinator.swift
//  CoordinatorsExample
//
//  Created by Griffin Storback on 2021-07-22.
//

import Foundation
import UIKit

/// Controls the upgrade flow (consists of UpgradeVC -> ConfirmUpgradeVC)
class UpgradeCoordinator: Coordinator {
    var parentCoordinator: MainCoordinator?
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
    
    func confirmUpgrade() {
        // upgrade has been confirmed, so dismiss UpgradeCoordinator flow
        navigationController.popToRootViewController(animated: true)
        parentCoordinator?.childCoordinatorDidFinish(self)
    }
}

extension UpgradeCoordinator: Login {
    func login() {
        let loginVC = LoginViewController()
        loginVC.coordinator = self
        navigationController.pushViewController(loginVC, animated: true)
    }
}
