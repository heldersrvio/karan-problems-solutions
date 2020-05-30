//
//  fetchStockData.swift
//  karan41
//
//  Created by Helder on 29/05/20.
//  Copyright © 2020 Helder de Melo Sérvio Filho. All rights reserved.
//

import Alamofire

struct MetaData: Codable{
    let information, symbol, lastRefreshed, interval, outputSize, timeZone: String
    
    enum CodingKeys: String, CodingKey{
        case information = "1. Information"
        case symbol = "2. Symbol"
        case lastRefreshed = "3. Last Refreshed"
        case interval = "4. Interval"
        case outputSize = "5. Output Size"
        case timeZone = "6. Time Zone"
    }
}

struct SnapShot: Codable{
    let open, high, low, close, volume: String
    
    enum CodingKeys: String, CodingKey{
        case open = "1. open"
        case high = "2. high"
        case low = "3. low"
        case close = "4. close"
        case volume = "5. volume"
    }
}

struct Stock: Codable{
    let metaData: MetaData
    let timeSeries5min: [String: SnapShot]
    
    enum CodingKeys: String, CodingKey{
        case metaData = "Meta Data"
        case timeSeries5min = "Time Series (5min)"
    }
}

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
