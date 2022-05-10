
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var coordinator: TabBarCoordinator!
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
                
        guard let scene = (scene as? UIWindowScene) else { return }
        let firstController = UINavigationController()
        window = UIWindow(windowScene: scene)
        coordinator = TabBarCoordinator(navigator: firstController)
        
        let tabBarController: UITabBarController = coordinator.tabController
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        

        
//
//
//
//        let tabBarController = UITabBarController()
//
//        let loginVC: LoginViewController = {
//            let vc = LoginViewController()
//            vc.tabBarItem = UITabBarItem(title: "Profile", image: .init(imageLiteralResourceName: "profile") , tag: 0)
//            vc.view.backgroundColor = .white
//            let myFabric = MyLoginFactory()
//            vc.delegate = myFabric.factory()
//            return vc
//        }()
//
//        let feedVC: FeedViewController = {
//            let vc = FeedViewController()
//            vc.view.backgroundColor = .blue
//            vc.tabBarItem = UITabBarItem(title: "Feed", image: .init(imageLiteralResourceName: "connect") , tag: 1)
//            return vc
//        }()
//        let feedNavVC = UINavigationController(rootViewController: feedVC)
//        let profileNavVC = UINavigationController(rootViewController: loginVC)
//        profileNavVC.navigationBar.isHidden = true
//
//        tabBarController.viewControllers = [feedNavVC , profileNavVC]
//        tabBarController.tabBar.backgroundColor = .white
//        window?.rootViewController = tabBarController
    }
}

