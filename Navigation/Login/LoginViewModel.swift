//
//  LoginViewModel.swift
//  Navigation
//
//  Created by Simon Pegg on 26.04.2022.
//

import Foundation
enum LoginConfigType {
    case first
    case second
    
}
protocol LoginViewOutput {
    var configuration: LoginConfigType { get }
    var onSelectAction: (() -> Void)? { get }
    
}
class LoginViewModel {
    var modelLogic: Bool// интерфейс Model -> ViewModelvar
    var onModuleOutput: (() -> Void)? // интерфейс ViewModel -> Model
    init (logic: Bool) {
        self.modelLogic = logic
    }
}

extension LoginViewModel: LoginViewOutput {
    var configuration: LoginConfigType {
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
