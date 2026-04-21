//
//  StorageServiceType.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import Foundation

protocol StorageServiceType {
    func save<T: Encodable>(_ item: T, key: String)
    func load<T: Decodable>(key: String) -> T?
}
