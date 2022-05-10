import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    var rootViewController: UIViewController = UIViewController()
        
    var tabBarController: UITabBarController
    
    var childCoordinators = [Coordinator]()
    
        
    required init(_ tabBarController: UITabBarController) {
        self.tabBarController = tabBarController

    }

    func start() {
        showFirstFlow()
    }
        

    func showFirstFlow() {
        let tabCoordinator = TabBarCoordinator.init()
        tabCoordinator.start()
        childCoordinators.append(tabCoordinator)
    }
}


