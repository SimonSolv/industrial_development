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
public class UserStorage {
    public var userPajama = User(name: "Pajama Kid", avatar: UIImage(named: "ProfilePic"), status: "Waiting for something")
    public var userUnknown  = User(name: "Unknown User", avatar: UIImage(named: "Unknown_user"), status: "set status below")
    public var userTester = User(name: "Test User", avatar: UIImage(named: "TestAvatar"), status: "testing system")
    public var userCurrent: User? = nil
}

public class CurrentUserService: UserServiceProtocol {
    public func UserDataCollect(userName: String?)-> User {
        switch userName {
        case UserStorage().userPajama.name:
            return UserStorage().userPajama
        case UserStorage().userTester.name:
            return UserStorage().userTester
        default:
            return UserStorage().userUnknown
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

