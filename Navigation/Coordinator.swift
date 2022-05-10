import Foundation
import UIKit
//
//public protocol Coordinator: AnyObject {
//
//    var rootViewController: UIViewController { get }
//
//    var childCoordinators: [Coordinator] { get set }
//
//    func showNext()
//}

protocol CoordinatorProtocol {
    
    var navigationController: UINavigationController { get set }
    
    init(navigator: UINavigationController)
    
    func startCustomFlow()
    
}
