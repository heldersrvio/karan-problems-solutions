import Foundation
import XCTest

struct complexNumber: Equatable{
    var real: Double
    var imaginary: Double
    
    init(_ real: Double, _ imaginary: Double){
        self.real = real
        self.imaginary = imaginary
    }
    
    static func ==(c1: complexNumber, c2: complexNumber) -> Bool{
        return Double(String(format: "%.2f", c1.real)) == Double(String(format: "%.2f", c2.real)) && Double(String(format: "%.2f", c1.imaginary)) == Double(String(format: "%.2f", c1.imaginary))
    }
    
    func addition(_ number: complexNumber) -> complexNumber{
        return complexNumber(number.real + self.real, number.imaginary + self.imaginary)
    }
    
    func multiplication(_ number: complexNumber) -> complexNumber{
        return complexNumber(number.real * self.real - number.imaginary * self.imaginary, number.imaginary * self.real + number.real * self.imaginary)
    }
    func negation() -> complexNumber{
        return complexNumber(-self.real, -self.imaginary)
    }
    func inversion() -> complexNumber{
        return complexNumber(self.real / (pow(self.real, 2) + pow(self.imaginary, 2)), -self.imaginary / (pow(self.real, 2) + pow(self.imaginary, 2)))
    }
    func subtraction(_ number: complexNumber) -> complexNumber{
        return addition(number.negation())
    }
    func division(_ number: complexNumber) -> complexNumber{
        return multiplication(number.inversion())
    }
}

func test(){
    let myNumber1 = complexNumber(1, 2)
    let myNumber2 = complexNumber(5, 5)
    let myNumber3 = complexNumber(-4.5, 0)
    let myNumber4 = complexNumber(0, -0.6)
    
    XCTAssertEqual(myNumber1.addition(myNumber2), complexNumber(6, 7))
    XCTAssertEqual(myNumber2.subtraction(myNumber3), complexNumber(9.5, 5))
    XCTAssertEqual(myNumber3.multiplication(myNumber4), complexNumber(0, 2.7))
    XCTAssertEqual(myNumber4.division(myNumber1), complexNumber(-0.24, -0.12))
}

test()
