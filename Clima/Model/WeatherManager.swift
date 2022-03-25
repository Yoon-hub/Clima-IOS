//
//  WeatherManager.swift
//  Clima
//
//  Created by 최윤제 on 2022/03/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//
import Foundation
import CoreLocation

struct WeatherManager{
    
    let WeatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=8652385cb56516e952f953c03191a7c5&units=metric"
    
    var delegate: WeatherManageDelegate? // WeatherManagerDelegate를 채택한 class중에서 함수를 실행하겠다
    
    func fetchWeather(cityName: String){
        let urlString = "\(WeatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees ){
        let urlString = "\(WeatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(urlString: urlString)
        
    }
    
    func performRequest(urlString: String){
        // 네트워킹의 네 단계
        // 1. URL 만들고
        if let url = URL(string: urlString){
            
            // 2. URL Session 만들고
            let session = URLSession(configuration: .default)
            // 3. Session한테 일주고
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error != nil{
                    delegate?.didFailWithError(error: error!)
                    return // 에러가 발생하면 다른일 안하겠다
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData){
                        delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
                
            }
            // 4. 일시작하고
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do{
            let decodeData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodeData.weather[0].id
            let temp = decodeData.main.temp
            let name = decodeData.name

            let weather = WeatherModel(condtitionId: id, cityName: name, temperature: temp)
            return weather
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    

}


