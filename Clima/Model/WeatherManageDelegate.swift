//
//  WeatherManageDelegate.swift
//  Clima
//
//  Created by 최윤제 on 2022/03/24.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManageDelegate{
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}
