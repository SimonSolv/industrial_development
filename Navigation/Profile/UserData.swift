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
    func UserDataCollect(userName: String?) -> User
       
}
private class UserStorage {
    var userPajama = User(name: "Pajama Kid", avatar: UIImage(named: "ProfilePic"), status: "Waiting for something")
    var userUnknown  = User(name: "Unknown User", avatar: UIImage(named: "Unknown_user"), status: "set status below")
    var userTester = User(name: "Test User", avatar: UIImage(named: "TestAvatar"), status: "testing system")
    var userCurrent: User? = nil
}

public class CurrentUserService: UserServiceProtocol {
    private var storage = UserStorage()
    
    public func UserDataCollect(userName: String?)-> User {
        switch userName {
        case storage.userPajama.name:
            return storage.userPajama
        case storage.userTester.name:
            return storage.userTester
        default:
            return storage.userUnknown
        }
    }
}

final class TestUserService: UserServiceProtocol {
    let user1 = User(name: "Test User", avatar: UIImage(named: "TestAvatar"), status: "Test status")
    func UserDataCollect(userName: String?)-> User {
        return user1
    }
}

