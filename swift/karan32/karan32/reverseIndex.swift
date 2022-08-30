//
//  reverseIndex.swift
//  karan32
//
//  Created by Helder on 26/05/20.
//  Copyright © 2020 Helder de Melo Sérvio Filho. All rights reserved.
//

import Foundation

func buildIndex(_ files: [String]) -> [String: [String]]{
    var index : [String: [String]] = [:]
    for poem in files{
        let path = Bundle.main.path(forResource: poem, ofType: "txt")
        let wordsArray : [[Substring]]?
        do{
            wordsArray = try String(contentsOfFile: path!, encoding: String.Encoding.utf8).lowercased().filter({$0 != "." && $0 != ","}).split(separator: "\n").map({$0.split(separator: " ")})
        }catch{
            wordsArray = nil
        }
        for line in wordsArray!{
            for word in line{
                if index[String(word)] != nil && !index[String(word)]!.contains(poem){
                    index[String(word)]!.append(poem)
                }else{
                    index[String(word)] = [poem]
                }
            }
        }
    }
    return index
}

func lookUpWords(_ index: [String: [String]], _ word: String) -> [String]?{
    return index[word]
}

