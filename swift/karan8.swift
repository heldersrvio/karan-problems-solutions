import Foundation

func valueToCoins(_ value: Double) -> [Int]{
    var v = value - Double(Int(value))
    var coins: [Int] = [0, 0, 0, 0]
    while v > 0.25{
        v -= 0.25
        coins[0] += 1
    }
    while v > 0.1{
        v -= 0.1
        coins[1] += 1
    }
    while v > 0.05{
        v -= 0.05
        coins[2] += 1
    }
    while v > 0.01{
        v -= 0.01
        coins[3] += 1
    }
    return coins
}

func calcChange(_ price: Double, _ given: Double) -> Double{
    return given - price
}

let change = calcChange(30.43, 45)
let coins: [Int] = valueToCoins(change)
print("The price is 30.43, I gave 45. The change is \(change) and I am going to receive \(coins[0]) quarters, \(coins[1]) dimes, \(coins[2]) nickels and \(coins[3]) pennies.")
