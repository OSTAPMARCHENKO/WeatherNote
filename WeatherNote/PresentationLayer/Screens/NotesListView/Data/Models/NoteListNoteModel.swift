//
//  NoteListNoteModel.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import Foundation

import Foundation

protocol NoteListNoteModelType {
    var id: String { get }
    var titleText: String { get }
    var dateString: String { get }
    var temperatureString: String? { get }
    var hasWeather: Bool { get }
}

struct NoteListNoteModel: NoteListNoteModelType, Identifiable {
    let id: String
    private(set) var titleText: String
    private(set) var dateString: String
    private(set) var temperatureString: String?
    private(set) var hasWeather: Bool
    
    let domainNote: NoteModel
}

extension NoteListNoteModel: Equatable {
    static func == (lhs: NoteListNoteModel, rhs: NoteListNoteModel) -> Bool {
        lhs.id == rhs.id
    }
}
