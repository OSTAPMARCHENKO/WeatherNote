//
//  NoteListNoteModel.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

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
    var titleText: String {
        domainNote.text
    }
    var dateString: String {
        domainNote.createdAt.formattedForNote()
    }
    var temperatureString: String? {
        guard let temp = domainNote.weather?.formattedTemp else {
            return "--"
        }
        
        return String(temp)
    }
    var hasWeather: Bool {
        domainNote.weather != nil
    }
    
    let domainNote: NoteModel
}

extension NoteListNoteModel: Equatable {
    static func == (lhs: NoteListNoteModel, rhs: NoteListNoteModel) -> Bool {
        lhs.id == rhs.id
    }
}
