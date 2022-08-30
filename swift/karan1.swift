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

func findPI(_ digitN: Int){
    let digitND = Double(digitN)
    let r = round(Double.pi * (10^^digitND))/(10^^digitND)
    print("\(r)")
}

let n = 10
findPI(n)
