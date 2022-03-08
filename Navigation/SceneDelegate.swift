
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        window?.makeKeyAndVisible()
        
        let tabBarController = UITabBarController()
        
        let loginVC: LoginViewController = {
            let vc = LoginViewController()
            vc.tabBarItem = UITabBarItem(title: "Profile", image: .init(imageLiteralResourceName: "profile") , tag: 0)
            vc.view.backgroundColor = .white
            vc.delegate = LoginInspector()
            return vc
        }()

        let feedVC: FeedViewController = {
            let vc = FeedViewController()
            vc.view.backgroundColor = .blue
            vc.tabBarItem = UITabBarItem(title: "Feed", image: .init(imageLiteralResourceName: "connect") , tag: 1)
            return vc
        }()
        let feedNavVC = UINavigationController(rootViewController: feedVC)
        let profileNavVC = UINavigationController(rootViewController: loginVC)
        profileNavVC.navigationBar.isHidden = true
        tabBarController.viewControllers = [feedNavVC , profileNavVC]
        tabBarController.tabBar.backgroundColor = .white
        window?.rootViewController = tabBarController
    }
}

