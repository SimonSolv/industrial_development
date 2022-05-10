//
//  TabBarCoordinator.swift
//  Navigation
//
//  Created by Simon Pegg on 08.04.2022.
//

import Foundation
import UIKit
enum TabBarPage {
    case login
    case feed

    init?(index: Int) {
        switch index {
        case 0:
            self = .feed
        case 1:
            self = .login
        default:
            return nil
        }
    }
    
    func pageTitleValue() -> String {
        switch self {
        case .login:
            return "Login"
        case .feed:
            return "Feed"
        }
    }

    func pageOrderNumber() -> Int {
        switch self {
        case .login:
            return 0
        case .feed:
            return 1
        }
    }
    
    func tabIconsValue() -> UITabBarItem {
        switch self {
        case .login:
            return UITabBarItem(title: "Profile", image: .init(imageLiteralResourceName: "profile") , tag: 0)
        case .feed:
            return UITabBarItem(title: "Feed", image: .init(imageLiteralResourceName: "connect") , tag: 1)
        }
    }

}
