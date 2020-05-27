//
//  palindrome.swift
//  karan37
//
//  Created by Helder on 27/05/20.
//  Copyright © 2020 Helder de Melo Sérvio Filho. All rights reserved.
//

import Foundation

extension String{
    func isPalindrome() -> Bool{
        return self == String(self.reversed())
    }
}
