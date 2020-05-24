import UIKit
import Combine

print("Future Playground")

var subscriptions = Set<AnyCancellable>()

//create future publisher
let future = FutureFactory.futureIncrement(integer: 12, afterDelay: 3)

//subscribe to it now
future
    .sink(receiveCompletion: {
        print($0)
    }, receiveValue: {
        print($0)
    })
    .store(in: &subscriptions)


Future<Int, Never> { (promise) in
    promise(.success(2))
}
    
.sink(receiveCompletion: {
    print($0)
}, receiveValue: {
    print($0)
})

