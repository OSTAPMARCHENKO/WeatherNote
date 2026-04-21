//
//  WeatherInfoModel.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import Foundation

struct WeatherInfoModel: Codable {
    let temp: Double?
    let description: String?
    let iconCode: String?
    let locationName: String?
    
    // Helper to get formatted temperature
    var formattedTemp: Int? {
        guard let temp else {
            return nil
        }
        
        return Int(temp.rounded())
    }
}

