//
//  EditFile.swift
//  karan39
//
//  Created by Helder on 27/05/20.
//  Copyright © 2020 Helder de Melo Sérvio Filho. All rights reserved.
//

import SwiftUI

struct EditFile: View {
    @Binding var content : String
    @Binding var fileName : String
    var body: some View {
        VStack{
            TextField("Write your text here", text: self.$content).padding()
            Spacer()
            Text("Save").foregroundColor(.green).padding().onTapGesture {
                writeToFile(self.fileName, self.content)
            }
        }
    }
}
