import Foundation
import XCTest

infix operator ^^
func ^^ (a: Int, b: Int) -> Int{
    var c = b
    if c == 0{
        return 1
    }else{
        c -= 1
        return a * (a^^c)
    }
}

func isHappyNumber(_ n: Int, _ sums: [Int]? = nil) -> Bool{
    var sums2: [Int] = []
    if sums != nil{
        sums2 = sums!
    }
    var digits: [Int] = []
    var buffer = n
    var sum: Int = 0
    repeat{
        digits.append(buffer % 10)
        buffer = buffer / 10
    } while buffer >= 1
    for digit in digits{
        sum += digit^^2
    }
    if sum == 1{
        return true
    }else if sums2.contains(sum){
        return false
    }else{
        sums2.append(sum)
        return isHappyNumber(sum, sums2)
    }
}

func findFirstEight() -> [Int]{
    var myList: [Int] = []
    var i = 1
    repeat{
        if isHappyNumber(i){
            myList.append(i)
        }
        i += 1
        
    }while myList.count < 8
    return myList
}

func test(){
    XCTAssertEqual(findFirstEight(), [1, 7, 10, 13, 19, 23, 28, 31])
}

test()
