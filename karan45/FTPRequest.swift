//
//  FTPRequest.swift
//  karan45
//
//  Created by Helder on 06/06/20.
//  Copyright © 2020 Helder de Melo Sérvio Filho. All rights reserved.
//

import Foundation

func FTPDownload(url: String, fileName: String){
    guard let myURL = URL(string: url + "/" + fileName) else{
        print("This is not a valid URL")
        return
    }


    let downloadTask = URLSession.shared.downloadTask(with: myURL){
        urlOrNil, responseOrNil, errorOrNil in
        guard let fileURL = urlOrNil else { return }
        print(fileURL)
        do {
            let documentsURL = try
                FileManager.default.url(for: .documentDirectory,
                                        in: .userDomainMask,
                                        appropriateFor: nil,
                                        create: false)
            let savedURL = documentsURL.appendingPathComponent(fileURL.lastPathComponent)
            try FileManager.default.moveItem(at: fileURL, to: savedURL)
            let downloadedData = try Data(contentsOf: savedURL)
            FileManager.default.createFile(atPath: documentsURL.appendingPathComponent(fileName).path, contents: downloadedData, attributes: nil)
        } catch {
            print ("file error: \(error)")
        }
    }
    
    downloadTask.resume()
}

func FTPUpload(to url: String, from fileName: String){
    guard let myURL = URL(string: url) else{
        print("This is not a valid URL")
        return
    }
    
    do{
        let fileURL = try
        FileManager.default.url(for: .documentDirectory,
                                in: .userDomainMask,
                                appropriateFor: nil,
            create: false).appendingPathComponent(fileName)
        
        
        let request = URLRequest(url: myURL)
        
        let uploadTask = URLSession.shared.uploadTask(with: request, fromFile: fileURL){
            data, response, error in
            if let error = error{
                print("\(error)")
                return
            }
            print(response?.mimeType ?? "No mime type")
        }
        uploadTask.resume()
    }catch{
        print(error.localizedDescription)
    }
}
