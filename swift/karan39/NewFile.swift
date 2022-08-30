//
//  NewFile.swift
//  karan39
//
//  Created by Helder on 27/05/20.
//  Copyright © 2020 Helder de Melo Sérvio Filho. All rights reserved.
//

import SwiftUI

func writeToFile(_ newFileName: String, _ content: String){
    let url = getDocumentsDirectory().appendingPathComponent(newFileName + ".txt")
    do{
        try content.write(to: url, atomically: true, encoding: .utf8)
    }catch{
        print(error.localizedDescription)
    }
}

struct NewFile: View {
    @State var fileName = ""
    @State var content = ""
    var body: some View {
        VStack{
            TextField("Type the name of your file", text: $fileName).padding()
            TextField("Write your text here", text: self.$content).padding()
            Spacer()
            Text("Save").foregroundColor(.green).padding().onTapGesture {
                writeToFile(self.fileName, self.content)
            }
        }
    }
}

struct NewFile_Previews: PreviewProvider {
    static var previews: some View {
        NewFile()
    }
}
