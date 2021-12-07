import Foundation
import UIKit

public class User {
    var name: String?
    var avatar: UIImage?
    var status: String?
    init(name: String?, avatar: UIImage?, status: String?) {
        self.name = name
        self.avatar = avatar
        self.status = status
    }
}

protocol UserServiceProtocol {
    func UserDataCollect(userName: String?)-> User
       
}

public class CurrentUserService: UserServiceProtocol {
    public var user1 = User(name: "Pajama Kid", avatar: UIImage(named: "ProfilePic"), status: "Waiting for something")
}
extension CurrentUserService {
    public func UserDataCollect(userName: String?)-> User {
        if userName == user1.name {
            return user1
        }
        else {
            let user2 = User(name: "Incorrect Username", avatar: nil, status: nil)
            return user2
        }
    }
}
public let defaultUser: CurrentUserService = CurrentUserService()
final class TestUserService: UserServiceProtocol {
    let user1 = User(name: "Test User", avatar: UIImage(named: "TestAvatar"), status: "Test status")
    func UserDataCollect(userName: String?)-> User {
        return user1
    }
}
