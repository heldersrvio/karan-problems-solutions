import Foundation
import Darwin

let e = Darwin.M_E
infix operator ^^
func ^^(a: Double, b: Double) -> Double{
    var c = b
    if c == 0{
        return 1
    }
    c -= 1
    return a * (a^^c)
}

func eDigitN(_ number: Int){
    let a = Double(number)
    let b = round(e * (10^^a)) / (10^^a)
    print("\(b)")
}

let digits = 15
eDigitN(digits)
