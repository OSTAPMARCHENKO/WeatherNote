//
//  NoteDetailDataModelType.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

// MARK: - Protocol

protocol NoteDetailDataModelType {
    var text: String { get }
    var dateString: String { get }
    var temperature: String { get }
    var weatherDescription: String { get }
    var locationName: String { get }
    var hasWeather: Bool { get }
}

struct NoteDetailDataModel: NoteDetailDataModelType {
    let text: String
    let dateString: String
    let temperature: String
    let weatherDescription: String
    let locationName: String
    let hasWeather: Bool
    
    init(model: NoteModel) {
        self.text = model.text
        self.dateString = model.createdAt.formattedForNote()
        self.weatherDescription = model.weather?.description ?? "No Data"
        self.locationName = model.weather?.locationName ?? "Unknown Location"
        self.hasWeather = model.weather != nil
        
        if let temp = model.weather?.formattedTemp {
            self.temperature = String(temp) + "°C"
        }
        else {
            self.temperature = "---"
        }
    }
}
