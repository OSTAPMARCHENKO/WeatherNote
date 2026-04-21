//
//  NoteDetailViewModel.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import Foundation
import Combine

final class NoteDetailViewModel: BaseViewModel, NoteDetailViewModelType {
    
    // MARK: - Published
    
    @Published private(set) var dataModel: NoteDetailDataModelType
    
    // MARK: - Life cycle
    
    init(note: NoteModel) {
        self.dataModel = NoteDetailDataModel(model: note)
        super.init()
    }
}
