//
//  ContentView.swift
//  karan35
//
//  Created by Helder on 26/05/20.
//  Copyright © 2020 Helder de Melo Sérvio Filho. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    var body: some View {
        VStack {
            Text("Pig Latin").font(.title)
            TextField("Type a sentence in English", text: $text).padding()
            Text(pigLatin(text))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
