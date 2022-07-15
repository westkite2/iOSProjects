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
            //let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            //func handle(data: Data?, response: URLResponse?, error:Error?)
            let task  = session.dataTask(with: url) { data, response, error in
                //process once dataTask done
                if error != nil{
                    print(error!)
                    return
                }
                
                if let safeData = data{
                    //let dataString = String(data: safeData, encoding: .utf8)
                    //print(dataString)
                    parseJSON(weatherData: safeData)
                }
            }
            //4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data){
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            print(weather.temperatureString)
            
        }catch{
            print(error)
        }
    }
    
}
