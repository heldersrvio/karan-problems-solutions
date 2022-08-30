//
//  ContentView.swift
//  karan43
//
//  Created by Helder on 30/05/20.
//  Copyright © 2020 Helder de Melo Sérvio Filho. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var vigenereKey: String = ""
    @State var vernamKey: String = ""
    @State var caesarShift: String = ""
    @State var vigenereMessage: String = ""
    @State var vernamMessage: String = ""
    @State var caesarMessage: String = ""
    @State var vigenereCode: String = ""
    @State var vernamCode: String = ""
    @State var caesarCode: String = ""
    var body: some View {
        VStack {
            HStack {
                Text("Vigenere cipher").bold().padding()
                TextField("Key", text: $vigenereKey)
                TextField("Message", text: $vigenereMessage)
                Button(action: {self.vigenereCode = vigenere(self.vigenereMessage, self.vigenereKey)}){
                    Text("Done").padding()
                }
            }
            Text(vigenereCode).padding()
            HStack {
                Text("Vernam cipher").bold().padding()
                TextField("Key", text: $vernamKey)
                TextField("Message", text: $vernamMessage)
                Button(action: {
                    if let vc = vernam(self.vernamMessage, self.vernamKey){
                        self.vernamCode = vc
                    } else{
                        self.vernamCode = "Key and message must have the same length"
                    }
                    
                }){
                    Text("Done").padding()
                }
            }
            Text(vernamCode).padding()
            HStack {
                Text("Caesar cipher").bold().padding()
                TextField("Right shift", text: $caesarShift)
                TextField("Message", text: $caesarMessage)
                Button(action: {
                    if let rshift = Int(self.caesarShift){
                        self.caesarCode = caesar(self.caesarMessage, rshift)
                    }else{
                        self.caesarCode = "Shift number is invalid"
                    }
                        }){
                            Text("Done").padding()
                }
            }
            Text(caesarCode).padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
