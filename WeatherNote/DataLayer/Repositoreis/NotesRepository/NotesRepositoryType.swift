//
//  NotesRepositoryType.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import Foundation
import Combine

protocol NotesRepositoryType {
    var notesPublisher: AnyPublisher<[NoteModel], Never> { get }
    
    func getAllNotes() -> [NoteModel]
    func createNote(text: String) async throws -> NoteModel
}

