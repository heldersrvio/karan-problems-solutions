//
//  ContentView.swift
//  karan40
//
//  Created by Helder on 28/05/20.
//  Copyright © 2020 Helder de Melo Sérvio Filho. All rights reserved.
//

import SwiftUI
import AlamofireRSSParser

struct ContentView: View {
    @State var ttbd = ""
    var body: some View {
        Text(ttbd).onAppear(){
            RSSParser.getRSSFeedResponse(path: "http://feeds.foxnews.com/foxnews/latest?format=xml") { (rssFeed: RSSFeed?, status: NetworkResponseStatus) in
                for item in rssFeed!.items{
                    self.ttbd = self.ttbd + "\n" + item.title!
                }
                //self.ttbd = rssFeed?.description as! String
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
