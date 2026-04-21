//
//  JSONDecoder+Default.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import Foundation

extension JSONDecoder {
    static let defaultDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
         decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}
