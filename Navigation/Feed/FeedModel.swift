import Foundation
final class FeedModel {
    
    var controlWord = "Password"
    var checkWord: String
    
    init(checkWord: String) {
        self.checkWord = checkWord
    }
    
    func check() -> Bool {
        if checkWord == controlWord {
            return true
        } else {return false}
    }
}
