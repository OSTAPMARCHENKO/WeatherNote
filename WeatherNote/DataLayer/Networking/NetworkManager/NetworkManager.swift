//
//  NetworkManager.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import Foundation

final class NetworkService: NetworkServiceProtocol {
    private let session: URLSession
    private let baseURL = "https://api.openweathermap.org/data/2.5"
    private let apiKey = "API_KEY"

    init(session: URLSession = .shared) {
        self.session = session
    }

    func execute<T: Decodable>(_ request: APIRequest) async throws -> T {
        var components = URLComponents(string: baseURL + request.path)
        
        var queryItems = request.queryItems ?? []
        queryItems.append(URLQueryItem(name: "appid", value: apiKey))
        queryItems.append(URLQueryItem(name: "units", value: "metric"))
        components?.queryItems = queryItems

        guard let url = components?.url else { throw URLError(.badURL) }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue

        let (data, response) = try await session.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }

        return try JSONDecoder().decode(T.self, from: data)
    }
}
