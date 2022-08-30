import Foundation
import XCTest

func numberOfSteps(_ n: Int) -> Int{
    if n == 1{
        return 0
    }
    if n % 2 == 0{
        return 1 + numberOfSteps(n / 2)
    }else{
        return 1 + numberOfSteps(n * 3 + 1)
    }
}

func test(){
    XCTAssertEqual(numberOfSteps(12), 9)
    XCTAssertEqual(numberOfSteps(27), 111)
}
test()
