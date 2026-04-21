//
//  NoteModel.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import Foundation

struct Note: Identifiable, Codable, Equatable, Hashable {
    let id: UUID
    let text: String
    let createdAt: Date
    let weather: WeatherInfo?
    
    init(id: UUID = UUID(),
         text: String,
         createdAt: Date = Date(),
         weather: WeatherInfo? = nil
    ) {
        self.id = id
        self.text = text
        self.createdAt = createdAt
        self.weather = weather
    }
}
