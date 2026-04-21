//
//  WeatherService.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import Foundation

final class WeatherService: WeatherServiceType {
    private let network: NetworkServiceProtocol

    init(network: NetworkServiceProtocol) {
        self.network = network
    }

    func fetchWeather(for city: String) async throws -> WeatherInfoModel {
        let request = GetWeatherRequest(city: city)
        let dto: WeatherModelResponse = try await network.execute(request)
        
        // Mapping DTO to Domain Model
        return WeatherInfoModel(
            temp: dto.main?.temp,
            description: dto.weather?.first?.description,
            iconCode: dto.weather?.first?.icon,
            locationName: dto.name
        )
    }
}
