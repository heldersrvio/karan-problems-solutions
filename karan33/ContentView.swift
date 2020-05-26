//
//  ContentView.swift
//  karan33
//
//  Created by Helder on 26/05/20.
//  Copyright © 2020 Helder de Melo Sérvio Filho. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Text("Natural Numbers from 1 to 100").font(.title).padding()
            List{
                ForEach(1...100, id: \.self){
                    Text(fizzBuzz(number: $0))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
