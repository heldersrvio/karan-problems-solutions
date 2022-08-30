//
//  encryption.swift
//  karan43
//
//  Created by Helder on 30/05/20.
//  Copyright © 2020 Helder de Melo Sérvio Filho. All rights reserved.
//

import Foundation

let alphabet: [Character] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

func vigenere(_ message: String, _ key: String) -> String{
    var alphabetDictionary : [Character: [Character]] = [:]
    for letter in alphabet{
        let value = alphabet.filter({$0 >= letter}) + alphabet.filter({$0 < letter})
        alphabetDictionary[letter] = value
    }
    
    let messageArray = Array(message.uppercased())
    let keyArray = Array(key.uppercased())
    
    var codedMessage: String = ""
    for i in 0..<messageArray.count{
        codedMessage.append(alphabetDictionary[keyArray[i % keyArray.count]]![alphabet.firstIndex(of: messageArray[i])!])
    }
    return codedMessage
}

func vernam(_ message: String, _ key: String) -> String?{
    if key.count != message.count{
        return nil
    }
    let messageArray = Array(message.uppercased())
    let keyArray = Array(key.uppercased())
    var codedMessage: String = ""
    
    for i in 0..<messageArray.count{
        let sumResult = (alphabet.firstIndex(of: messageArray[i])! + alphabet.firstIndex(of: keyArray[i])!) % 26
        codedMessage.append(alphabet[sumResult])
    }
    return codedMessage
}

func caesar(_ message: String, _ rightShift: Int) -> String{
    let newAlphabet = alphabet.map({alphabet[(alphabet.firstIndex(of: $0)! + rightShift) % 26 ]})
    return String(message.uppercased().map({newAlphabet[alphabet.firstIndex(of: $0)!]}))
}
