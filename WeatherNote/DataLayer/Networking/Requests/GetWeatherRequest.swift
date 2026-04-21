//
//  GetWeatherRequest.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import Foundation

private struct GetWeatherRequest: APIRequest {
    let city: String
    var path: String { "/weather" }
    var method: HTTPMethod { .get }
    var queryItems: [URLQueryItem]? {
        [URLQueryItem(name: "q", value: city)]
    }
}
