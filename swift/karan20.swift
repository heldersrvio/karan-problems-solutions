import Foundation
import XCTest

func flipCoin(_ times: Int) -> [String]{
    let arr = ["tail", "head"]
    if times == 1{
        return [arr.randomElement()!]
    }
    return [arr.randomElement()!] + flipCoin(times - 1)
}

func test(){
    let arr = flipCoin(10)
    XCTAssertEqual(arr.count, 10)
    print(arr)
    let headCount = arr.reduce(0, { x, y in
        if y == "head"{
            return x + 1
        }
        return x
    })
    let tailCount = arr.reduce(0, { x, y in
        if y == "tail"{
            return x + 1
        }
        return x
    })
    print("There were \(headCount) heads and \(tailCount) tails")
}

test()
