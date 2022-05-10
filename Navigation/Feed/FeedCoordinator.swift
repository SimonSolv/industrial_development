//
//  FeedCoordinator.swift
//  Navigation
//
//  Created by Simon Pegg on 09.04.2022.
//

import Foundation
import UIKit


class FeedCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    required init(navigator: UINavigationController) {
        navigationController = navigator
        
    }
    
    func startCustomFlow() {
        let feedModule = ModuleFactory.makeFeedModule()
        feedModule.input.modelLogic = true
//        feedModule.output.onSelectAction = {
//            // определяем коллбэк, что происходит на выходе из модуля
//            
//        }
        navigationController.pushViewController(feedModule.view, animated: true)
    }
    
}

//protocol FeedCoordinatorProtocol: Coordinator {
//    func showFeedNavController()
//    func showPost()
//}
//
//class FeedCoordinator: FeedCoordinatorProtocol {
//    func showPost() {
//        navigationController.pushViewController(ModuleFactory().makePostModule(), animated: true)
//    }
//
//    func showFeedNavController() {
//        navigationController.pushViewController(rootViewController, animated: true)
//    }
//
//    var rootViewController: UIViewController
//
//    var navigationController: UINavigationController
//
//    var childCoordinators: [Coordinator] = []
//
//    func showNext() {
//        showFeedNavController()
//    }
//
//    required init(_ navigationController: UINavigationController) {
//        self.navigationController = navigationController
//        rootViewController = FeedViewController()
//    }
//
//}

//class NavigationCoordinator: NSObject, Coordinator {
//    var childCoordinators: [Coordinator]
//
//    func start() {
//        <#code#>
//    }
//
//    required init(_ navigationController: UINavigationController) {
//        <#code#>
//    }
//
//
//    public var navigationController: UINavigationController
//
//    public override init() {
//        self.navigationController = UINavigationController()
//        self.navigationController.view.backgroundColor = .white
//        super.init()
//    }
//
//    public var rootViewController: UIViewController {
//        return navigationController
//    }
//}
