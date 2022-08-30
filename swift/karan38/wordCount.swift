//
//  wordCount.swift
//  karan38
//
//  Created by Helder on 27/05/20.
//  Copyright © 2020 Helder de Melo Sérvio Filho. All rights reserved.
//

import Foundation

extension String{
    func wordCount() -> Int{
        return self.split(separator: " ").count
    }
}
