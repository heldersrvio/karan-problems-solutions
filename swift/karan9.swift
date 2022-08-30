import Foundation

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

func btd(_ bNumber: Int) -> Int{
    var buffer: Double = Double(bNumber)
    var decimals: Double
    var d: Int = 0
    var index: Int = 0
    while buffer > 1{
        buffer = buffer / 10
        decimals = round((buffer - Double(Int(buffer))) * 100)
        if decimals > 9{
            d += 2^^index
        }
        index += 1
    }
    return d
}

func dtb(_ dNumber: Int) -> Int{
    var buffer: Int = dNumber
    var s: String = ""
    while buffer >= 1{
        s = s + String(buffer % 2)
        buffer = buffer / 2
    }
    s = String(s.reversed())
    return Int(s)!
}

print(btd(111))
print(dtb(25))
