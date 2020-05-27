//
//  ContentView.swift
//  karan36
//
//  Created by Helder on 27/05/20.
//  Copyright © 2020 Helder de Melo Sérvio Filho. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var text = ""
    var body: some View {
        VStack {
            Text("Vowel Count").font(.title)
            TextField("Type your sentence", text: $text).padding()
            Text(String(vowelCount(text)))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
