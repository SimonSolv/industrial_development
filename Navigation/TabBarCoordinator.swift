import Foundation
import UIKit
final class TabBarCoordinator: NSObject, CoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    var childCoordinators: [CoordinatorProtocol] = []
    
    let loginNavController: UINavigationController = UINavigationController()
    
    let feedNavController: UINavigationController = UINavigationController()
    
    let tabController: UITabBarController

    let loginCoordinator: CoordinatorProtocol
    
    let feedCoordinator: CoordinatorProtocol

    var coordinators: [CoordinatorProtocol] {
        return [feedCoordinator, loginCoordinator]
    }
    
    init(navigator: UINavigationController) {
        
        navigationController = navigator
        
        tabController = UITabBarController()
        
        loginCoordinator = LoginCoordinator(navigator: loginNavController)
        
        feedCoordinator = FeedCoordinator(navigator: feedNavController)
        
        var controllers: [UIViewController] = []
        
        super.init()
        
        let loginVC = loginCoordinator.navigationController
        loginVC.tabBarItem = UITabBarItem(title: "Profile", image: .init(imageLiteralResourceName: "profile") , tag: 0)
        
        let feedVC = feedCoordinator.navigationController
        feedVC.tabBarItem = UITabBarItem(title: "Feed", image: .init(imageLiteralResourceName: "connect") , tag: 1)
        controllers.append(feedVC)
        controllers.append(loginVC)
        
        tabController.tabBar.backgroundColor = .white
        tabController.viewControllers = controllers
        tabController.tabBar.isTranslucent = false
    }
    
    func startCustomFlow() {
        
    }
    
    func showNext() {
        //nothing to do here
    }
    
    
    var rootViewController: UIViewController {
        return tabController
    }
    


//    override init() {
//        
//        tabController = UITabBarController()
//        
//        loginCoordinator = LoginCoordinator(navigator: loginNavController)
//        
//        feedCoordinator = FeedCoordinator(navigator: feedNavController)
//        
//        var controllers: [UIViewController] = []
//        
//        super.init()
//        
//        let loginVC = loginCoordinator.navigationController
//        loginVC.tabBarItem = UITabBarItem(title: "Profile", image: .init(imageLiteralResourceName: "profile") , tag: 0)
//        
//        let feedVC = feedCoordinator.navigationController
//        feedVC.tabBarItem = UITabBarItem(title: "Feed", image: .init(imageLiteralResourceName: "connect") , tag: 1)
//        controllers.append(feedVC)
//        controllers.append(loginVC)
//        
//        tabController.tabBar.backgroundColor = .white
//        tabController.viewControllers = controllers
//        tabController.tabBar.isTranslucent = false
//        
//    }
}
