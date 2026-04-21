//
//  WeatherDescriptionModelResponse.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import Foundation

struct WeatherDescriptionModelResponse: Decodable {
    let description: String?
    let icon: String?
}
