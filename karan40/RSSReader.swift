//
//  RSSReader.swift
//  karan40
//
//  Created by Helder on 28/05/20.
//  Copyright © 2020 Helder de Melo Sérvio Filho. All rights reserved.
//
//Based on the model published by florin at: https://www.iosapptemplates.com/blog/swift-programming/implement-rss-feed-parser-swift

import Alamofire
import AlamofireRSSParser


public enum NetworkResponseStatus {
    case success
    case error(string: String?)
}
public class RSSParser {
    public static func getRSSFeedResponse(path: String, completionHandler: @escaping (_ response: RSSFeed?,_ status: NetworkResponseStatus) -> Void) {
        AF.request(path).responseRSS() { response in
            switch response.result {
            case let .success(value):
                print(value.description)
                completionHandler(value, .success)
            case let .failure(error):
                print(error)
                completionHandler(nil, .error(string: error.localizedDescription))
            }
        }
    }
}
