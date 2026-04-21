//
//  NetworkService.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import Foundation

final class NetworkService: NetworkServiceProtocol {
    private let session: URLSession
    private let baseURL = "https://api.openweathermap.org/data/3.0"
    private let apiKey = "ccad92a869f1d242475b4ee534460fb0"

    init(session: URLSession = .shared) {
        self.session = session
    }

    func execute<T: Decodable>(_ request: APIRequest) async throws -> T {
        guard var components = URLComponents(string: baseURL + request.path) else {
            throw URLError(.badURL)
        }
        
        // Setup shared query parameters
        var queryItems = request.queryItems ?? []
        queryItems.append(contentsOf: [
            URLQueryItem(name: "appid", value: apiKey),
            URLQueryItem(name: "units", value: "metric")
        ])
        
        components.queryItems = queryItems

        guard let url = components.url else {
            throw URLError(.badURL)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue

        let (data, response) = try await session.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }

        // Using snake_case strategy for API 3.0 compatibility
        let decoder = JSONDecoder.defaultDecoder
        
        return try decoder.decode(T.self, from: data)
    }
}

