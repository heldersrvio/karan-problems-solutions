//
//  ContentView.swift
//  karan37
//
//  Created by Helder on 27/05/20.
//  Copyright © 2020 Helder de Melo Sérvio Filho. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var text = ""
    var body: some View {
        VStack {
            Text("Did I enter a palindrome?").font(.title)
            TextField("Type a word", text: $text).padding()
            if text.isEmpty{
                //
            }
            else if text.isPalindrome(){
                Text("This is a palindrome!")
            }else{
                Text("Not a palindrome")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
