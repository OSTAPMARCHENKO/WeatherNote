//
//  NotesRepositoryType.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import Foundation

protocol NotesRepositoryType {
    func getAllNotes() -> [NoteModel]
    func createNote(text: String) async throws -> NoteModel
}
