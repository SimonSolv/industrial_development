//
//  MainCoordinator.swift
//  Navigation
//
//  Created by Simon Pegg on 08.04.2022.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    var tabBarController: UITabBarController
    
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let vc = UITabBarController()
        navigationController.pushViewController(vc, animated: false)
    }
    
    
}
