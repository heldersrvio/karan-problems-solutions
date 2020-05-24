import Foundation
import XCTest

infix operator ^^
func ^^ (a: Int, b: Int) -> Int{
    if b == 0{
        return 1
    }else if b % 2 == 0{
        return (a^^(b/2)) * (a^^(b/2))
    }
    return ((a^^((b - 1)/2)) * (a^^((b - 1)/2))) * a
}

func test(){
    XCTAssertEqual(2^^4, 16)
    XCTAssertEqual(5^^3, 125)
    XCTAssertEqual(10^^4, 10000)
}

test()
