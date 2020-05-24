import Foundation

infix operator ^^
func ^^ (a: Double, b: Double) -> Double{
    var c = b
    if c == 0{
        return 1.0
    }else{
        c -= 1
        return a * (a^^c)
    }
}

func monthlyPayment(_ interval: Character, _ owned: Double, _ interest: Double, _ terms: Int) -> Double{
    let t : Double
    let i : Double
    if interval == "y"{
        t = Double(terms) * 12
        i = Double(interest) / 12
    }
    else if interval == "w"{
        t = Double(terms) / 4
        i = Double(interest) * 4
    }
    else if interval == "d"{
        t = Double(terms) / 30
        i = Double(interest) * 30
    }else{
        t = Double(terms)
        i = interest
    }
    let num = owned * i
    let den = (1 - ((1/(1 + i))^^(t)))
    return num/den
}

print(monthlyPayment("y", 200000, 0.065, 30))
