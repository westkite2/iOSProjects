//
//  WeatherData.swift
//  Clima
//
//  Created by Ayeon on 2022/07/15.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable{ //Decodable, Encodable
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable{
    let temp: Double
}

struct Weather: Codable{
    let id: Int
}
