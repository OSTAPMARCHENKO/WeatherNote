//
//  NotesViewModelType.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import Foundation

protocol NotesListViewModelType: BaseViewModelType {
    var notes: [NoteModel] { get }
    
    func loadData()
    func addNewNote()
    func selectNote(_ note: NoteModel)
    func formatDate(_ date: Date) -> String
}
