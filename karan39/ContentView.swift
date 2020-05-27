//
//  ContentView.swift
//  karan39
//
//  Created by Helder on 27/05/20.
//  Copyright © 2020 Helder de Melo Sérvio Filho. All rights reserved.
//

import SwiftUI

func getDocumentsDirectory() -> URL{
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

struct ContentView: View {
    var body: some View {
        NavigationView{
            List{
                NavigationLink(destination: OldFile()){
                    Text("Open file").padding()
                }
                NavigationLink(destination: NewFile()){
                    Text("Create new file").padding()
                }
            }.navigationBarTitle("Text Editor")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
