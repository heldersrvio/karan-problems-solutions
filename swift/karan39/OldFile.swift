//
//  OldFile.swift
//  karan39
//
//  Created by Helder on 27/05/20.
//  Copyright © 2020 Helder de Melo Sérvio Filho. All rights reserved.
//

import SwiftUI

func readOldFile(_ fileName: String) -> String?{
    let url = getDocumentsDirectory().appendingPathComponent(fileName + ".txt")
    do{
        let result = try String(contentsOf: url)
        return result
    }catch{
        print(error.localizedDescription)
    }
    return nil
}

func writeToOldFile(_ fileName: String, _ content: String){
    let url = getDocumentsDirectory().appendingPathComponent(fileName + ".txt")
    do{
        try content.write(to: url, atomically: true, encoding: .utf8)
    }catch{
        print(error.localizedDescription)
    }
}

struct OldFile: View {
    @State var fn = ""
    @State var savedText = ""
    @State var activeof = false
    @State var activeem = false
    var body: some View {
        VStack {
            TextField("Type the file name", text: $fn).padding()
            NavigationLink(destination: NothingWasFound(), isActive: $activeem) {
                EmptyView()
            }
            NavigationLink(destination: EditFile(content: self.$savedText, fileName: self.$fn), isActive: $activeof) {
                EmptyView()
            }

            Spacer()
            Button(action: {
                if readOldFile(self.fn) == nil{
                    self.activeem = true
                }else{
                    self.savedText = readOldFile(self.fn)!
                    self.activeof = true
                }
                
            }){
                 Text("Done").foregroundColor(.green).padding()
            }
        }
        
    }
}

struct OldFile_Previews: PreviewProvider {
    static var previews: some View {
        OldFile()
    }
}
