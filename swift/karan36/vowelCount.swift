//
//  vowelCount.swift
//  karan36
//
//  Created by Helder on 27/05/20.
//  Copyright © 2020 Helder de Melo Sérvio Filho. All rights reserved.
//

import Foundation

extension Character{
    func isVowel() -> Bool{
        return ["a", "A", "e", "E", "i", "I", "o", "O", "u", "U"].contains(self)
    }
}

func vowelCount(_ a: String) -> Int{
    return a.reduce(0, {result, element in
        if element.isVowel(){
            return result + 1
        }
        return result
    })
}
