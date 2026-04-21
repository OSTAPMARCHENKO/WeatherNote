//
//  NetworkServiceProtocol.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import Foundation

protocol NetworkServiceProtocol {
    func execute<T: Decodable>(_ request: APIRequest) async throws -> T
}
