import Foundation

func primeList(_ number: Int) -> [Int]{
    var p: [Int] = []
    if number == 2{
        p.append(2)
        return p
    }
    else if (2..<number).filter({number % $0 == 0}).isEmpty{
        p.append(number)
    }
    p.append(contentsOf: primeList(number - 1))
    return p
}

func factors(_ number: Int) -> [Int]{
    var factors: [Int] = []
    var pr = number
    for v in primeList(number){
        while pr % v == 0{
            pr = pr / v
            factors.append(v)
        }
    }
    return factors
}

let c = 165
let l: [Int] = factors(c)
print(l)
