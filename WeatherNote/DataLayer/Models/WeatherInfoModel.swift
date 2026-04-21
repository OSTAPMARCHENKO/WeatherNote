//
//  WeatherInfoModel.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import Foundation

struct WeatherInfo: Codable, Equatable, Hashable {
    let temp: Double
    let description: String
    let iconCode: String
    let locationName: String
    
    // Helper to get formatted temperature string
    var formattedTemp: String {
        return "\(Int(temp.rounded()))"
    }
}
