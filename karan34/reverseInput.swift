//
//  reverseInput.swift
//  karan34
//
//  Created by Helder on 26/05/20.
//  Copyright © 2020 Helder de Melo Sérvio Filho. All rights reserved.
//

import Foundation

func reverseInput(_ input: String) -> String{
    var newString: String = ""
    if input.isEmpty{
        return newString
    }
    var currentIndex = input.index(before: input.endIndex)
    repeat{
        newString.append(input[currentIndex])
        if currentIndex != input.startIndex{
            currentIndex = input.index(currentIndex, offsetBy: -1)
        }
    }while currentIndex != input.startIndex
    newString.append(input[currentIndex])
    
    return newString
}
