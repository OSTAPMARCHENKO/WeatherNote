//
//  AddNoteViewModelType.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import Foundation
import Combine

protocol AddNoteViewModelType: BaseViewModelType {
    var dataModel: AddNoteDataModelType { get set }
    var isLoading: Bool { get }
    var errorMessage: String? { get }
    
    func saveNote()
    func cancel()
}
