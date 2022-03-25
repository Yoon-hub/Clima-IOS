//
//  WeatherData.swift
//  Clima
//
//  Created by 최윤제 on 2022/03/23.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable{
    let name: String
    let main: Main
    let weather: [Weather]
    let wind: Wind
    
}

struct Main: Codable{
    let temp: Double
}
 
struct Weather: Codable{
    let id: Int
}

struct Wind: Codable{
    let speed: Double
}
