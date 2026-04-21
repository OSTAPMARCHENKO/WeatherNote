//
//  APIRequest.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import Foundation

protocol APIRequest {
    var path: String { get }
    var method: HTTPMethod { get }
    var queryItems: [URLQueryItem]? { get }
}
