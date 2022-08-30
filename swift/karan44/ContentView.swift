//
//  ContentView.swift
//  karan44
//
//  Created by Helder on 31/05/20.
//  Copyright © 2020 Helder de Melo Sérvio Filho. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var regex = ""
    @State var str = ""
    @State var matches: [String] = []
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your text", text: $str).padding()
                TextField("Enter a regular expression", text: $regex).padding()
                Button(action: {
                    do{
                        let mtc = try self.str.matches(for: self.regex)
                        if mtc != nil && !mtc!.isEmpty{
                            self.matches = mtc!
                        }else{
                            self.matches = ["No matches were found"]
                        }
                    }catch{
                        self.matches = ["Regular expression is invalid"]
                    }
                    }){ Text("Done")}.padding()
            }
            ForEach(matches, id: \.self){
                Text($0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
