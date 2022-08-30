import Foundation
import XCTest
import Darwin

func leftLimit(_ fx: (Double) -> Double, _ xValue: Double) -> Double?{
    let approx = xValue - 0.1
    let s = String(format: "%.2f", fx(approx + 0.0999999))
    if let ret = Double(s){
        return ret
    }
    return nil
}

func rightLimit(_ fx: (Double) -> Double, _ xValue: Double) -> Double?{
    let approx = xValue + 0.1
    let s = String(format: "%.2f", fx(approx - 0.0999999))
    if let ret = Double(s){
        return ret
    }
    return nil
}

func limit(_ fx: (Double) -> Double, _ xValue: Double) -> Double?{
    if rightLimit(fx, xValue) != leftLimit(fx, xValue){
        return nil
    }
    return rightLimit(fx, xValue)
}

func test(){
    XCTAssertEqual(limit({ x in
        return (pow(x, 2) - 1) / (x - 1)
    }, 1), 2)
    XCTAssertEqual(limit({ x in
        return (sin(x)) / x
    }, 0), 1)
    XCTAssertEqual(limit({ x in
        if x < 0{
            return 1
        }
        return 2
    }, 0), nil)
}

test()
