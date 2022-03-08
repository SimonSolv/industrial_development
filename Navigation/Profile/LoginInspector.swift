import Foundation
class LoginInspector: LoginViewControllerDelegate {

    func checkPswd(login: String, password: String) -> Bool {
        if (login + password).hashValue == Checker.shared.check() {
            print ("Accepted")
            return true
        }
        else {
            print ("Denied")
            return false
        }
    }
}
