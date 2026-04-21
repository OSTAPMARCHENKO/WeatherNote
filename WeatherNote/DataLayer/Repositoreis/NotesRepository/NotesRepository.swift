//
//  NotesRepository.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import Foundation

final class NotesRepository: NotesRepositoryType {
    private let weatherService: WeatherServiceType
    private let storage: StorageServiceType
    private let storageKey = "saved_notes"

    init(weatherService: WeatherServiceType, storage: StorageServiceType) {
        self.weatherService = weatherService
        self.storage = storage
    }

    func getAllNotes() -> [NoteModel] {
        return storage.load(key: storageKey) ?? []
    }

    func createNote(text: String) async throws -> NoteModel {
        let weather = try? await weatherService.fetchWeather(for: "Kyiv")
        let newNote = NoteModel(text: text, weather: weather)
        
        var currentNotes = getAllNotes()
        currentNotes.insert(newNote, at: 0)
        storage.save(currentNotes, key: storageKey)
        
        return newNote
    }
}
