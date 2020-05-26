//
//  ContentView.swift
//  karan32
//
//  Created by Helder on 24/05/20.
//  Copyright © 2020 Helder de Melo Sérvio Filho. All rights reserved.
//

import SwiftUI

let poems = ["poem1", "poem2", "poem3", "poem4", "poem5", "poem7"]
let myIndex: [String: [String]] = buildIndex(poems)

struct ContentView: View {
    
    @State private var searchText : String = ""

    var body: some View {
        NavigationView{
            VStack {
                SearchBar(text:$searchText, placeholder: "Search poems")
                List{
                    ForEach( poems.filter({
                        return self.searchText.isEmpty ? true: lookUpWords(myIndex, self.searchText) != nil && lookUpWords(myIndex, self.searchText)!.contains($0)
                    }), id: \.self){
                        poem in
                        Text(poem + ".txt")
                    }
                }.navigationBarTitle(Text("Poems"))
               
            }
        }
    }
}

struct ContentView_Previews:
    PreviewProvider {
    static var previews: some View {
            ContentView()
        }
}

