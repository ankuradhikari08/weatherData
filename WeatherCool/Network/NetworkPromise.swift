//
//  NetworkPromise.swift
//  WeatherCool
//
//  Created by ankuradhikari on 23/07/20.
//  Copyright © 2020 Color. All rights reserved.
//

import Foundation

public typealias Success = (_ responseData:NSData, _ urlResponse:URLResponse) -> Void
public typealias FileDataSuccess = (_ responseData:NSData) -> Void

class NetworkPromise: NSObject {
   
    private lazy var sessionManager : URLSession = {
           let session = URLSession.init(configuration: URLSessionConfiguration.default)
           return session
       }()
    
    func initWithRequest(url:URL, successBlock: Success?) {

        let dataTask:URLSessionDataTask = self.sessionManager.dataTask(with: url) { (data, resp, error) in
                
            successBlock!(data! as NSData, resp! as URLResponse)
        }
    
        dataTask.resume()
    }
    
    
    func fetchFileData(fileName:String) -> NSData {
        
        let filePath:String = Bundle.main.path(forResource: fileName, ofType: "json")!
        let jsonData:NSData = NSData.init(contentsOfFile: filePath)!
        
        //in case we have to convert data in Hashmap
        //let jsonData:NSDictionary = try! JSONSerialization.jsonObject(with: jsonData as Data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
        //successBlock!(jsonData)
        return jsonData
    }
}
