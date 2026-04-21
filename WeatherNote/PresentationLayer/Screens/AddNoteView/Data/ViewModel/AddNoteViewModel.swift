//
//  AddNoteViewModel.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import Foundation
import Combine

final class AddNoteViewModel: BaseViewModel, AddNoteViewModelType {
    
    // MARK: - Action typealiases
    
    typealias EmptyAction = () -> Void
    
    // MARK: - Nested
    
    struct Events {
        let close: EmptyAction
    }
    
    // MARK: - Published
    
    @Published var dataModel: AddNoteDataModelType = AddNoteDataModel()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    // MARK: - Properties(Private)
    
    @Inject private var repository: NotesRepositoryType
    private let events: Events
    
    // MARK: - Life cycle
    init(events: Events) {
        self.events = events
        super.init()
    }
    
    // MARK: - Methods(Public)
    func saveNote() {
        guard dataModel.isValid else { return }
        
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                // Repository fetches weather and saves locally
                let _ = try await repository.createNote(text: dataModel.text)
                
                await MainActor.run {
                    isLoading = false
                    events.close()
                }
            } catch {
                await MainActor.run {
                    isLoading = false
                    // Handle network error specifically for weather fetching
                    self.errorMessage = "Weather data unavailable. Note saved locally."
                    
                    // Delay to allow user to see the message
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        self.events.close()
                    }
                }
            }
        }
    }
    
    func cancel() {
        events.close()
    }
}
