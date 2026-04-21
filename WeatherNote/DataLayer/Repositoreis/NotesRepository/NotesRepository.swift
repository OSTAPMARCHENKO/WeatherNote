//
//  NotesRepository.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import Foundation
import Combine

final class NotesRepository: NotesRepositoryType {
    private let weatherService: WeatherServiceType
    private let storage: StorageServiceType
    private let storageKey = "saved_notes"
    
    // Combine subject to broadcast changes
    private let notesSubject = CurrentValueSubject<[NoteModel], Never>([])
    
    var notesPublisher: AnyPublisher<[NoteModel], Never> {
        notesSubject.eraseToAnyPublisher()
    }

    init(weatherService: WeatherServiceType, storage: StorageServiceType) {
        self.weatherService = weatherService
        self.storage = storage
    }
    
    func getAllNotes() -> [NoteModel] {
        let savedNotes: [NoteModel] = storage.load(key: storageKey) ?? []
        notesSubject.send(savedNotes)
        
        return savedNotes
    }


    func createNote(text: String) async throws -> NoteModel {
        let weather = try? await weatherService.fetchWeather(for: "Kyiv")
        
        print(weather)
        // Create and save
        let newNote = NoteModel(text: text, weather: weather)
        var currentNotes = notesSubject.value
        currentNotes.insert(newNote, at: 0)
        
        storage.save(currentNotes, key: storageKey)
        
        // 3. Notify subscribers
        notesSubject.send(currentNotes)
        
        return newNote
    }
}

