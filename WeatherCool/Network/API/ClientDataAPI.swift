//
//  ClientDataAPI.swift
//  WeatherCool
//
//  Created by ankuradhikari on 23/07/20.
//  Copyright © 2020 Color. All rights reserved.
//

import Foundation


typealias SuccessCallback = (_ responseData:WeatherModel, _ responseString:String) -> Void


class ClientDataAPI: NSObject {
    
    func fetchClientData(lat:Double,lng:Double, _ success:@escaping SuccessCallback) {
        
        //https://api.openweathermap.org/data/2.5/weather?lat=23&lon=71&appid=e76950dc2166ea872278120522f35051
      
        let urlString = String(format: "%@?lat=%f&lon=%f&appid=%@", NetworkConstants.baseUrl,lat,lng,NetworkConstants.apiKey)
        let requestUrl = URL(string: urlString)!
        
        let networkpromise:NetworkPromise = NetworkPromise.init()
        
        networkpromise.initWithRequest(url: requestUrl) { (data, response) in
            let jsonString = String(data: data as Data, encoding: String.Encoding.utf8)!
            let weatherModel:WeatherModel = try! JSONDecoder().decode(WeatherModel.self, from: data as Data)
            success(weatherModel,jsonString)
        }
    }
}
