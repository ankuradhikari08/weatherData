//
//  DetailViewController.swift
//  WeatherCool
//
//  Created by ankuradhikari on 23/07/20.
//  Copyright © 2020 Color. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {

    public var latitiude:Double = 0.0
    public var longitude:Double = 0.0
    
    @IBOutlet weak var detailTextView: UITextView!
    
    @IBOutlet weak var jsonStringView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let clientData:ClientDataAPI =  ClientDataAPI.init()
        clientData.fetchClientData(lat: self.latitiude, lng: self.longitude) { (data,jsonString) in
         
            var string = String()
            
            string.append(String(format: "Lattitide = %f \n", data.coord.lat))
            string.append(String(format: "Longitude = %f \n", data.coord.lon))
            string.append(String(format: "Name = %@ \n", data.name))
            string.append(String(format: "Country = %@ \n", data.sys.country))
            string.append(String(format: "Weather Description = %@ \n", (data.weather.first! as Weather).weatherDescription))
            string.append(String(format: "Temprature = %.2f °C\n", data.main.temp - 273.17))
            string.append(String(format: "Temprature Min = %.2f °C\n", data.main.tempMin - 273.17))
            string.append(String(format: "Temprature Max = %.2f °C\n", data.main.tempMax - 273.17))
            string.append(String(format: "Humidity = %.2f \n", data.main.humidity))
            string.append(String(format: "Wind Speed = %.2f KM\n", data.wind.speed))
            
            
            DispatchQueue.main.async {
                self.detailTextView.text = string;
                self.jsonStringView.text = jsonString;
            }
            
        }
    }

}
