//
//  ContentView.swift
//  karan38
//
//  Created by Helder on 27/05/20.
//  Copyright © 2020 Helder de Melo Sérvio Filho. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var text = ""
    var body: some View {
        VStack {
            Text("How many words?").font(.title)
            TextField("Type a sentence", text: $text).padding()
            Text(String(text.wordCount()) + " words").foregroundColor(.blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
