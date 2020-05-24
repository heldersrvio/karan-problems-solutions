import Foundation
import XCTest

func factorial(_ n: Int) -> Int{
    if n == 0{
        return 1
    }
    return n * factorial(n - 1)
}

func factorial2(_ n: Int) -> Int{
    if n == 0{
        return 1
    }
    var b = n
    var i = 1
    while n - i > 0{
        b = b * (n - i)
        i += 1
    }
    return b
}

func test(){
    XCTAssertEqual(factorial(5), 120, "There is a problem with the recursive factorial")
    XCTAssertEqual(factorial2(5), 120, "There is a problem with the loop factorial")
    XCTAssertEqual(factorial(6), factorial2(6), "The two factorials yield different results")
}

test()
