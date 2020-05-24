import UIKit
import Combine

//Custome Subscriber

// 1. Create a publisher of integers via the range's publihser property.
let publisher = (1...6).publisher

//2. Define Custom Subscriber , IntSubscriber
final class IntSubscriber: Subscriber {
    
    //3. Implementing the type alias to specify that his subscriber can recieve Ingteger  and will never receeve
    typealias Input = Int
    typealias Failure = Never
    
    //4.
    func receive(subscription: Subscription) {
        print("Receive Subscription !!")
        subscription.request(.max(3))
    }
    
    //5.
    func receive(_ input: Int) -> Subscribers.Demand {
        print("Receive value : - ", input)
        return .none
    }
    
    //6.
    func receive(completion: Subscribers.Completion<Never>) {
        print("Receive Completion", completion)
    }
    
}


//Start from here
let subscriber = IntSubscriber()
publisher.subscribe(subscriber)
