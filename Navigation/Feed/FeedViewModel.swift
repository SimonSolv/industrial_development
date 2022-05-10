//
//  FeedViewModel.swift
//  Navigation
//
//  Created by Simon Pegg on 26.04.2022.
//

import Foundation

enum ConfigType {
    case first
    case second
    
}
protocol FeedViewOutput {
    var configuration: ConfigType { get }
    var onSelectAction: (() -> Void)? { get }
    
}
class FeedViewModel {
    
    var modelLogic: Bool// интерфейс Model -> ViewModelvar
    
    var onModuleOutput: (() -> Void)? // интерфейс ViewModel -> Model
    
    let postTitles = ["New Post 1", "New Post 2"]
    let postInformation: Post = Post(title: "Post Info")
    var controlWord = "Password"
    var checkWord: String?
//    let coordinator: FeedCoordinator = FeedCoordinator()
    
    init (logic: Bool) {
        self.modelLogic = logic
    }
}

extension FeedViewModel: FeedViewOutput {
    var configuration: ConfigType {
        if modelLogic {
            return .first
            
        } else {
            return .second
            
        }
        
    }
    var onSelectAction: (() -> Void)? {
        return {// определяем callback обратной связи View -> ViewModelself.onModuleOutput?()
            
        }
    }
}
extension FeedViewModel {
    
    func check(inputWord: String) -> Bool {
        if inputWord == controlWord {
            return true
        } else {return false}
    }


}
