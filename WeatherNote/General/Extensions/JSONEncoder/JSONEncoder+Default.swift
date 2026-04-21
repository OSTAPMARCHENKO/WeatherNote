//
//  JSONEncoder+Default.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2025.
//

import Foundation

extension JSONEncoder {
    static let defaultEncoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()
    
    static let defaultEncodingStrategyEncoder: JSONEncoder = {
        let encoder = JSONEncoder()
        return encoder
    }()
}
