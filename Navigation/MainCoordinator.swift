import Foundation
import UIKit

class AppCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    
    required init(controller: UINavigationController) {
        self.navigationController = controller
    }

    var tabBarController = UITabBarController()
    var coordinators: [CoordinatorProtocol]?
    var navigationControllers: [UINavigationController]?
    func eventAction(event: Event) {

    }

    func start() {

    }

}
