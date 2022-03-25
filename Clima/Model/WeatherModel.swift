//
//  WeatherModel.swift
//  Clima
//
//  Created by 최윤제 on 2022/03/24.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel{
    let condtitionId: Int
    let cityName: String
    let temperature: Double
     
    var temperatureString : String {
        return String(format: "%.1f", temperature)
    }
    
    var conditionName: String{
        switch condtitionId {
                case 200...232:
                    return "cloud.bolt"
                case 300...321:
                    return "cloud.drizzle"
                case 500...531:
                    return "cloud.rain"
                case 600...622:
                    return "cloud.snow"
                case 701...781:
                    return "cloud.fog"
                case 800:
                    return "sun.max"
                case 801...804:
                    return "cloud.bolt"
                default:
                    return "cloud"
                }
    }
    

    
}
