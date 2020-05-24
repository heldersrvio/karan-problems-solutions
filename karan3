import Foundation

func FibonacciN(_ number: Int)-> [Int]{
    var list: [Int] = [1]
    var order = 0
    var current = 1
    var previous = 0
    
    while order <= number{
        order += 1
        current = previous + current
        list.append(current)
        previous = current - previous
    }
    return list
}

let c = 18
print(FibonacciN(c))
