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
    typealias NoteAction = (_ note: Note) -> Void
    
    // MARK: - Nested
    
    struct Events {
        let showAddNote: EmptyAction
        let showNoteDetails: NoteAction
    }
    
    // MARK: - Published
    
    @Published var notes: [NoteModel] = []
    
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
    
    func loadData() async {
        repository.loadNotes()
    }
    
    func addNewNote() async {
        events.showAddNote()
    }
    
    func selectNote(_ note: NoteModel) {
        events.showNoteDetails(note)
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
                self?.notes = updatedNotes
            }
            .store(in: &cancellables)
    }
}
