//import Combine
//import Foundation
//
//final class ModelScenario {
//    
//    var routing: Bool = false
//    
//    var publisher: AnyPublisher<String, MyError>
//    private let customPublisher = CurrentValueSubject<String, MyError>("")
//    
//    init() {
//        publisher = customPublisher.eraseToAnyPublisher()
//    }
//    
//    struct DataSource {
//        let name: String
//    }
//    
//    func publishData() {
//        ["Moscow", "London", "Paris", "Madrid", "Zurich", "Bucharest", "Sofia", "Warsaw"].forEach { element in
//            self.customPublisher.send(element)
//        }
//    }
//}
//
//extension ModelScenario {
//    
//    typealias Input = String
//
//    
//    func receive(subscription: Subscription) {
//        subscription.request(.max(1))
//    }
//    
//    func receive(_ input: String) -> Subscribers.Demand {
//        Swift.print("Received value", input)
//        
//        return .max(1)
//    }
//
//}
