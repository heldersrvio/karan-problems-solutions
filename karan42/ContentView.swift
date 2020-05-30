//
//  ContentView.swift
//  karan42
//
//  Created by Helder on 30/05/20.
//  Copyright © 2020 Helder de Melo Sérvio Filho. All rights reserved.
//

import SwiftUI

struct Contribution: Hashable{
    var name: String = ""
    var comment: String = ""
    var date: Date = Date()
}

struct ContentView: View {
    @State var contributions: [Contribution] = []
    @State var name: String = ""
    @State var comment: String = ""
    var body: some View {
        VStack {
            ForEach(contributions, id: \.self){
                contribution in
                VStack {
                    Text(contribution.name).padding()
                    Text(contribution.comment).padding()
                    Text(format(contribution.date))
                }
                
            }
            TextField("Type your name", text: $name).padding()
            TextField("Leave a comment (Optional)", text: $comment).padding()
            Spacer()
            Button(action: {self.contributions.append(Contribution(name: self.name, comment: self.comment, date: Date()))}){
                Text("Submit")
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
