//
//  regex.swift
//  karan44
//
//  Created by Helder on 31/05/20.
//  Copyright © 2020 Helder de Melo Sérvio Filho. All rights reserved.
//

import Foundation

extension String{
    func matches(for regex: String) throws -> [String]?{
        let range = NSRange(location: 0, length: self.utf16.count)
        let regularExpression = try NSRegularExpression(pattern: regex)
        
        let matches = regularExpression.matches(in: self, options: [], range: range).map({self[Range($0.range, in: self)!]})
        
        return matches.map({String($0)})
        
    }
}
