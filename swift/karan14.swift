import Foundation

func replace(myString: String, _ index: Int, _ newChar: Character) -> String {
    var chars = Array(myString)
    chars[index] = newChar
    let modifiedString = String(chars)
    return modifiedString
}

func validateCreditCardNumber(_ number: Int) -> Bool{
    var nbuffer = number
    var arrayInt = [Int]()
    repeat{
        arrayInt.append(nbuffer % 10)
        nbuffer = nbuffer / 10
    } while nbuffer >= 1
    let lastDigit = arrayInt[0]
    arrayInt = Array(arrayInt[1...arrayInt.count - 1])
    let narrayInt = arrayInt
    arrayInt = narrayInt.enumerated().map{(index, elem) in
        if (index + 1) % 2 != 0 { if elem * 2 < 9 { return elem * 2} else{return elem * 2 - 9} } else{
            return elem
        }
    }
    var total = 0
    for n in arrayInt{
        total += n
    }
    if (lastDigit + total) % 10 == 0{
        return true
    }
    return false
}

print(validateCreditCardNumber(30380869913970))
