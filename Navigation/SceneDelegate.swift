import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: scene)
        window?.makeKeyAndVisible()

        let tabBarController = UITabBarController()

        let loginVC: LoginViewController = {
            let controller = LoginViewController()
            controller.tabBarItem = UITabBarItem(title: "Profile", image: .init(imageLiteralResourceName: "profile") , tag: 0)
            controller.view.backgroundColor = .white
            let myFabric = MyLoginFactory()
            controller.delegate = myFabric.factory()
            return controller
        }()

        let feedVC: FeedViewController = {
            let controller = FeedViewController()
            controller.view.backgroundColor = .blue
            controller.tabBarItem = UITabBarItem(title: "Feed", image: .init(imageLiteralResourceName: "connect") , tag: 1)
            return controller
        }()
        let feedNavVC = UINavigationController(rootViewController: feedVC)
        let profileNavVC = UINavigationController(rootViewController: loginVC)
        profileNavVC.navigationBar.isHidden = true
        tabBarController.viewControllers = [feedNavVC , profileNavVC]
        tabBarController.tabBar.backgroundColor = .white
        window?.rootViewController = tabBarController
    }
}
