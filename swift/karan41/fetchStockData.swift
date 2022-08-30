//
//  fetchStockData.swift
//  karan41
//
//  Created by Helder on 29/05/20.
//  Copyright © 2020 Helder de Melo Sérvio Filho. All rights reserved.
//

import Alamofire

func fetchStockJSON(_ stockSymbol: String, completionHandler: @escaping (String, String) -> ()){
    let date = Date().addingTimeInterval(-6*3600)
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH"
    let rightNow = formatter.string(from: date)
    let yesterday = formatter.string(from:date.addingTimeInterval(-24*3600))
    AF.request("https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=\(stockSymbol)&interval=60min&apikey=9ZGTOBRW3NQ4ZPQK").responseJSON{ response in
            switch response.result {
            case let .success(value):
                let todayClose = ((((value as! NSDictionary)["Time Series (60min)"]! as! NSDictionary)[rightNow + ":30:00"]) as! NSDictionary)["4. close"]!
                let yesterdayClose = ((((value as! NSDictionary)["Time Series (60min)"]! as! NSDictionary)[yesterday + ":30:00"]) as! NSDictionary)["4. close"]!
                completionHandler(todayClose as! String, yesterdayClose as! String)
            case let .failure(error):
                print(error)
            }
        }
}
