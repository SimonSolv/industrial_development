import Foundation
import UIKit

enum Event {
    case firstButtonTapped
    case secondButtonTapped
}

protocol CoordinatorProtocol {
    var navigationController: UINavigationController? {get set}
    var coordinators: [CoordinatorProtocol] {get set}

    func eventAction(event: Event)
    func start()
}

protocol CoordinatorRuledProtocol {
    var coordinator: CoordinatorProtocol? {get set}
    
}
