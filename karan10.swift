import Foundation

infix operator ^^
func ^^ (a: Double, b: Double) -> Double{
    var c = b
    if c == 0{
        return 1
    }else{
        c -= 1
        return a * (a^^c)
    }
}

func add(_ a: Double, _ b: Double) -> Double{
    return a + b
}

func subtract(_ a: Double, _ b: Double) -> Double{
    return a - b
}

func multiply(_ a: Double, _ b: Double) -> Double{
    return a * b
}

func divide(_ a: Double, _ b: Double) -> Double{
    return a / b
}

func power(_ a: Double, _ b: Double) -> Double{
    return a ^^ b
}

func root(_ a: Double, _ b: Double) -> Double{
    return pow(a, (1 / b))
}

print("Now let's try an expression")
print("40 * 15 - 5 + R30/3 / 4 = ?")
print(add(subtract(multiply(40, 15), 5), (divide(root(30, 3), 4))))
