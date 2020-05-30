//
//  ContentView.swift
//  karan41
//
//  Created by Helder on 29/05/20.
//  Copyright © 2020 Helder de Melo Sérvio Filho. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    @State var stockSymbol: String = ""
    @State var upOrDown: Color = .blue
    var body: some View {
        VStack {
            TextField("Type a stock symbol", text: $stockSymbol).padding()
            Text("Close value: " + text).foregroundColor(upOrDown)
            Spacer()
            Button("Done", action: {
                fetchStockJSON(self.stockSymbol){ (closeValue1, closeValue2) in
                self.text = closeValue1
                    self.upOrDown = (Double(closeValue1)! < Double(closeValue2)!) ? .red : .green
                }
                }).padding()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
