//
//  ContentView.swift
//  karan45
//
//  Created by Helder on 06/06/20.
//  Copyright © 2020 Helder de Melo Sérvio Filho. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var server: String = ""
    @State var fileName: String = ""
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
        VStack{
            TextField("Server", text: $server).padding().background(Color.white)
            TextField("File Name", text: $fileName).padding().background(Color.white)
            Button(action: {
                FTPDownload(url: self.server, fileName: self.fileName)
            }){
                Text("Download")
            }.padding().foregroundColor(.blue).background(Color.gray)
            Button(action: {
                FTPUpload(to: self.server, from: self.fileName)
            }){
                Text("Upload")
            }.padding().foregroundColor(.green).background(Color.gray)
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
