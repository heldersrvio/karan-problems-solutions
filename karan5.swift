import Foundation

func primes(_ number: Int) -> Int{
    var p = number + 1
    while !(2..<p).filter({p % $0 == 0}).isEmpty{
        p += 1
    }
    return p
}

var current = 1
var c: String
repeat{
    print("Do you wish to see the next prime number?")
    c = readLine()!
    if c == "y"{
        if c == "y"{
            current = primes(current)
            print(current)
        }
    }
}while c == "y"
