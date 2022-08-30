import Foundation
import XCTest

func oneLevel(_ s: String) -> String{
    switch(s){
    case "0":
        return ""
    case "1":
        return "one"
    case "2":
        return "two"
    case "3":
        return "three"
    case "4":
        return "four"
    case "5":
        return "five"
    case "6":
        return "six"
    case "7":
        return "seven"
    case "8":
        return "eight"
    case "9":
        return "nine"
    default:
        return ""
    }
}

func tenLevel(_ s: String) -> String{
    switch(s[s.startIndex]){
    case "1":
        switch(s[s.index(before: s.endIndex)]){
        case "0":
            return "ten"
        case "1":
            return "eleven"
        case "2":
            return "twelve"
        case "3":
            return "thirteen"
        case "4":
            return "fourteen"
        case "5":
            return "fifteen"
        case "6":
            return "sixteen"
        case "7":
            return "seventeen"
        case "8":
            return "eighteen"
        case "9":
            return "nineteen"
        default:
            return ""
        }
    case "2":
        return "twenty " + oneLevel(String(s[s.index(before: s.endIndex)]))
    case "3":
        return "thirty " + oneLevel(String(s[s.index(before: s.endIndex)]))
    case "4":
        return "forty " + oneLevel(String(s[s.index(before: s.endIndex)]))
    case "5":
        return "fifty " + oneLevel(String(s[s.index(before: s.endIndex)]))
    case "6":
        return "sixty " + oneLevel(String(s[s.index(before: s.endIndex)]))
    case "7":
        return "seventy " + oneLevel(String(s[s.index(before: s.endIndex)]))
    case "8":
        return "eighty " + oneLevel(String(s[s.index(before: s.endIndex)]))
    case "9":
        return "ninety " + oneLevel(String(s[s.index(before: s.endIndex)]))
    default:
        return oneLevel(String(s[s.index(before: s.endIndex)]))
    }
}

func hundredLevel(_ s: String) -> String{
    if s[s.startIndex] == "0"{
        return "and " + tenLevel(String(s.suffix(s.count - 1)))
    }
    if s[s.index(after: s.startIndex)...s.index(s.endIndex, offsetBy: -1)] == "00"{
        return oneLevel(String(s[s.startIndex])) + " hundred"
    }
    return oneLevel(String(s[s.startIndex])) + " hundred and " + tenLevel(String(s.suffix(s.count - 1)))
}

func thousandLevel(_ s: String) -> String{
    if s[s.startIndex] == "0"{
        return "and " + hundredLevel(String(s.suffix(s.count - 1)))
    }
    return oneLevel(String(s[s.startIndex])) + " thousand, " + hundredLevel(String(s.suffix(s.count - 1)))
}

func tenThousandLevel(_ s: String) -> String{
    if s[s.startIndex] == "0"{
        return "and " + thousandLevel(String(s.suffix(s.count - 1)))
    }
    return tenLevel(String(s[s.startIndex...s.index(after:s.startIndex)])) + " thousand, " + hundredLevel(String(s.suffix(s.count - 2)))
}

func hundredThousandLevel(_ s: String) -> String{
    if s[s.startIndex] == "0"{
        return "and " + tenThousandLevel(String(s.suffix(s.count - 1)))
    }
    return hundredLevel(String(s[s.startIndex...s.index(s.startIndex, offsetBy: 2)])) + " thousand, " + hundredLevel(String(s.suffix(s.count - 3)))
}

func million(_ s: String) -> String{
    return "one million"
}

func wrappingUp(_ s: String) -> String{
    switch(s.count){
    case 1:
        return oneLevel(s)
    case 2:
        return tenLevel(s)
    case 3:
        return hundredLevel(s)
    case 4:
        return thousandLevel(s)
    case 5:
        return tenThousandLevel(s)
    case 6:
        return hundredThousandLevel(s)
    case 7:
        return million(s)
    default:
        return ""
    }
}

func test(){
    let string1 = "5"
    let string2 = "46"
    let string3 = "200"
    let string4 = "4050"
    let string5 = "30299"
    let string6 = "555789"
    let string7 = "1000000"
    
    XCTAssertEqual(wrappingUp(string1), "five")
    XCTAssertEqual(wrappingUp(string2), "forty six")
    XCTAssertEqual(wrappingUp(string3), "two hundred")
    XCTAssertEqual(wrappingUp(string4), "four thousand, and fifty ")
    XCTAssertEqual(wrappingUp(string5), "thirty  thousand, two hundred and ninety nine")
    XCTAssertEqual(wrappingUp(string6), "five hundred and fifty five thousand, seven hundred and eighty nine")
    XCTAssertEqual(wrappingUp(string7), "one million")
}

test()
