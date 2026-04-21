//
//  GetWeatherRequest.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import Foundation

struct GetWeatherRequest: APIRequest {
    let latitude: Double
    let longitude: Double
    
    // Default values for Kyiv
    init(latitude: Double = 50.4501, longitude: Double = 30.5234) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    var path: String { "/onecall" }
    var method: HTTPMethod { .get }
    
    var queryItems: [URLQueryItem]? {
        [
            URLQueryItem(name: "lat", value: "\(latitude)"),
            URLQueryItem(name: "lon", value: "\(longitude)"),
            // Exclude minutely and hourly to simplify the response for this app
            URLQueryItem(name: "exclude", value: "minutely,hourly")
        ]
    }
}
