//
//  FizzBuzz.swift
//  karan33
//
//  Created by Helder on 26/05/20.
//  Copyright © 2020 Helder de Melo Sérvio Filho. All rights reserved.
//

import Foundation

func fizzBuzz(number: Int) -> String{
    var result : String = ""
    if number % 3 == 0{
        result = result + "Fizz"
    }
    if number % 5 == 0{
        result = result + "Buzz"
    }
    if result.isEmpty{
        return String(number)
    }
    return result
}
