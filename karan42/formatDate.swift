//
//  formatDate.swift
//  karan42
//
//  Created by Helder on 30/05/20.
//  Copyright © 2020 Helder de Melo Sérvio Filho. All rights reserved.
//

import Foundation

func format(_ date: Date) -> String{
    let formatter = DateFormatter()
    formatter.dateFormat = "MM-dd-yyyy"
    return formatter.string(from: date)
}
