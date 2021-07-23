//
//  Coordinator.swift
//  CoordinatorsExample
//
//  Created by Griffin Storback on 2021-07-20.
//

import UIKit

// Inherits AnyObject to enforce class (not struct)
protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

// make coordinator inherit this protocol if it can present login screen
protocol Login: AnyObject {
    func login()
}
