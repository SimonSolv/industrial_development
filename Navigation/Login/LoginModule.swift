//
//  LoginModel.swift
//  Navigation
//
//  Created by Simon Pegg on 16.04.2022.
//

import Foundation

class LoginModule {

    var input: LoginViewModel
    var output: LoginViewModel
    var view: LoginViewController
    init(input: LoginViewModel, output: LoginViewModel, view: LoginViewController) {
        self.input = input
        self.output = output
        self.view = view
    }

}

