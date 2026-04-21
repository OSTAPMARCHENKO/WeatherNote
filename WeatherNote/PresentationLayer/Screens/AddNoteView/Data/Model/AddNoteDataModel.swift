//
//  AddNoteDataModel.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import Foundation

protocol AddNoteDataModelType {
    var text: String { get set }
    var isValid: Bool { get }
}

struct AddNoteDataModel: AddNoteDataModelType {
    var text: String = ""
    
    var isValid: Bool {
        !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
