//
//  MainCoordinator.swift
//  CoordinatorsExample
//
//  Created by Griffin Storback on 2021-07-20.
//

import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        print("MainCoordinator init")
        self.navigationController = navigationController
    }
    
    func start() {
        print("MainCoordinator start")
        let mainVC = MainViewController()
        mainVC.coordinator = self
        navigationController.delegate = self
        navigationController.pushViewController(mainVC, animated: false)
    }
    
    func upgrade() {
        // create child coordinator for upgrade flow
        let upgradeCoordinator = UpgradeCoordinator(navigationController: navigationController)
        upgradeCoordinator.parentCoordinator = self
        childCoordinators.append(upgradeCoordinator)
        upgradeCoordinator.start()
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromVC = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        // If viewController array contains fromVC, it means new one being pushed, not popped.
        if navigationController.viewControllers.contains(fromVC) {
            print("MainCoordinator didShow - viewController array contains fromVC, so new one being pushed, not popped.")
            return
        }
        
        // We're popping a VC, so check if it is one of our child coordinator VCs (we just have the one for now - UpgradeVC)
        if let upgradeVC = fromVC as? UpgradeViewController {
            childCoordinatorDidFinish(upgradeVC.coordinator)
        }
        // If there were other possible child coordinators, we would check if their VC was being popped here.
    }
    
    func childCoordinatorDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                print("MainCoordinator childCoordinatorDidFinish REMOVING child")
                childCoordinators.remove(at: index)
                break
            }
        }
        print("MainCoordinator childCoordinatorDidFinish NO child removed")
    }
}

extension MainCoordinator: Login {
    func login() {
        let loginVC = LoginViewController()
        loginVC.coordinator = self
        navigationController.pushViewController(loginVC, animated: true)
    }
}
