//
//  WeatherModelResponse.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import Foundation

struct WeatherModelResponse: Decodable {
    
    let main: MainWeatherModelResponse
    let weather: [WeatherDescriptionModelResponse]?
    let name: String?
}
