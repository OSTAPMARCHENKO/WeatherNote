//
//  WeatherServiceType.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import Foundation

protocol WeatherServiceType {
    func fetchWeather(for city: String) async throws -> WeatherInfoModel
}
