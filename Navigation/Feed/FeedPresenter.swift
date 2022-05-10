//
//  FeedPresenter.swift
//  Navigation
//
//  Created by Simon Pegg on 16.04.2022.
//

import Foundation
import UIKit

protocol FeedPresenerDelegate: AnyObject {
    func presentPost(title: String)
    func presentAlert(title: String, message: String)
}

typealias PresenterDelegate = FeedPresenerDelegate & UIViewController

class FeedPresenter: PresenterModuleControllerOutput {
    func didSelectElement(_ element: String) {
        //anycode
    }
    
    weak var viewInput: PresenterModuleControllerInput?
    weak var delegate: PresenterDelegate?
    
    public func showPost(){
        
    }
    
    public func setViewDelegate (delegate: PresenterDelegate) {
        self.delegate = delegate
    }
    

}
