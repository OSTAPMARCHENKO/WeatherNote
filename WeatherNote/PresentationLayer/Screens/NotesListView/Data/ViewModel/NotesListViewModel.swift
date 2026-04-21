//
//  NotesListViewModel.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import Foundation
import Combine

final class NotesListViewModel: BaseViewModel, NotesListViewModelType {
    
    // MARK: - Action typealiases
    
    typealias EmptyAction = () -> Void
    typealias NoteAction = (_ note: NoteModel) -> Void
    
    // MARK: - Nested
    
    struct Events {
        let showAddNote: EmptyAction
        let showNoteDetails: NoteAction
    }
    
    // MARK: - Published
    
    @Published var notes: [NoteListNoteModelType] = []
    
    // MARK: - Properties(Private)
    
    @Inject private var repository: NotesRepositoryType
    private let events: Events
    
    // MARK: - Life cycle
    
    init(events: Events) {
        self.events = events
        super.init()
        
        setupSubscriptions()
    }
    
    // MARK: - Methods(Public)
    
    func loadData() {
        let notes = repository.getAllNotes()
        
        self.notes = notes.map{ NoteListNoteModel(id: $0.id.uuidString, domainNote: $0) }
    }
    
    func addNewNote() {
        events.showAddNote()
    }
    
    func selectNote(_ note: NoteListNoteModelType) {
        guard let note = note as? NoteListNoteModel else {
            return
        }
        
        events.showNoteDetails(note.domainNote)
    }
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    // MARK: - Methods(Private)
    
    private func setupSubscriptions() {
        // Subscribing to repository changes (Single Source of Truth)
        repository.notesPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] updatedNotes in
                self?.notes = updatedNotes.map{ NoteListNoteModel(id: $0.id.uuidString, domainNote: $0) }
            }
            .store(in: &cancellables)
    }
}
