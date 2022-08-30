import Foundation
import XCTest

struct markedNumber{
    var composite: Bool
    var number: Int
}

func sieve(_ n: Int) -> [Int]{
    var allNumbers: [markedNumber] = (2...n).map({ markedNumber(composite: false, number: $0)})
    var p = 2
    repeat{
        for number in p...(allNumbers.count - 1){
            if allNumbers[number].number % p == 0{
                allNumbers[number].composite = true
            }
        }
        repeat{
            p += 1
        }while p < n && allNumbers[p - 2].composite
    }while p < n
    return allNumbers.filter({!$0.composite}).map({$0.number})
}

func test(){
    XCTAssertEqual(sieve(10), [2, 3, 5, 7])
    XCTAssertEqual(sieve(50), [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47])
}

test()
