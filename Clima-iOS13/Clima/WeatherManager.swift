//
//  WeatherManager.swift
//  Clima
//
//  Created by westkite2 on 2022/07/14.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager{
    let weatherURL =
    "https://api.openweathermap.org/data/2.5/weather?appid=d223b8a9a6a0613641edd6492dbb6d39&units=metric"
    //use https not http
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        //1. Create a url
        
        if let url = URL(string: urlString){
            //2. Create a url session
            
            let session = URLSession(configuration: .default) //thing that can perform networking
            
            //3. Git the session a task
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            
            //4. Start the task
            task.resume()
        }
        
        func handle(data: Data?, response: URLResponse?, error:Error?){
            if error != nil{
                print(error!)
                return
            }
            
            if let safeData = data{
                let dataString = String(data: safeData, encoding: .utf8)
                print(dataString)
            }
        }
        
    }
}
