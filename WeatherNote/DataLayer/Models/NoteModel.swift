//
//  NoteModel.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import Foundation

struct NoteModel: Codable, Equatable, Hashable {
    let id: UUID
    let text: String
    let createdAt: Date
    let weather: WeatherInfoModel?
    
    init(id: UUID = UUID(),
         text: String,
         createdAt: Date = Date(),
         weather: WeatherInfoModel? = nil
    ) {
        self.id = id
        self.text = text
        self.createdAt = createdAt
        self.weather = weather
    }
}
