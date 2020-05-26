//
//  ContentView.swift
//  karan34
//
//  Created by Helder on 26/05/20.
//  Copyright © 2020 Helder de Melo Sérvio Filho. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var input: String = ""
    var body: some View {
        VStack {
            Text("Reversing your input").font(.title)
            TextField("Type your input", text: $input).padding()
            Text(reverseInput(input))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
