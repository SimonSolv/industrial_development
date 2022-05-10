
import Foundation
import UIKit

class LoginCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    required init(navigator: UINavigationController) {
        navigationController = navigator
        
    }
    
    func startCustomFlow() {
        let customModule = ModuleFactory.makeLoginModule()
        customModule.input.modelLogic = true
//        customModule.output.onSelectAction = {
//            // определяем коллбэк, что происходит на выходе из модуля
//
//        }
        navigationController.pushViewController(customModule.view, animated: true)
    }
    
}

//class LoginCoordinator: Coordinator {
//
//    var rootViewController: UIViewController
//    var navigationController: UINavigationController
//    let secondViewController: UIViewController = ProfileViewController()
//    var childCoordinators: [Coordinator] = []
//    
//    required init(_ navigationController: UINavigationController) {
//        self.navigationController = navigationController
//        rootViewController = LoginViewController()
//    }
//        
//    func showNext() {
//        self.navigationController.pushViewController(secondViewController, animated: false)
//    }
//
//}
