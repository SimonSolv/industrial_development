import Foundation

class Checker {
    private let login: String = "Vasily"
    private let pswd: String = "StrongPassword"
    static let shared: Checker = Checker()

    private init() {}

    public func check() -> Int {
        return (self.login + self.pswd).hashValue
    }
}
//защита от копирования
extension Checker: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}



