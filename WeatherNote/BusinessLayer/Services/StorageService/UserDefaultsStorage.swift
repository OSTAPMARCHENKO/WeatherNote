//
//  UserDefaultsStorage.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import Foundation

final class UserDefaultsStorage: StorageServiceType {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    func save<T: Encodable>(_ item: T, key: String) {
        if let data = try? encoder.encode(item) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    func load<T: Decodable>(key: String) -> T? {
        guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
        return try? decoder.decode(T.self, from: data)
    }
}
