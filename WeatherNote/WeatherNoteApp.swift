//
//  WeatherNoteApp.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import SwiftUI
import CoreData

@main
struct WeatherNoteApp: App {
    @StateObject private var router: AppRouter
    
    init() {
        setupDependencies()
        let appRouter = DIContainer.shared.resolve(AppRouter.self)
        _router = StateObject(wrappedValue: appRouter)
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                NotesListView(viewModel: makeNotesListViewModel())
                    .navigationDestination(for: AppRoute.self) { route in
                        switch route {
                        case .addNote:
                            AddNoteView(viewModel: makeAddNoteViewModel())
                            
                        case .noteDetail(let noteModel):
                            NoteDetailView(viewModel: NoteDetailViewModel(note: noteModel))
                        }
                    }
            }
        }
    }
    
    // MARK: - ViewModel Factories
    
    private func makeNotesListViewModel() -> NotesListViewModel {
        let events = NotesListViewModel.Events(
            showAddNote: {
                router.push(.addNote)
            },
            showNoteDetails: { noteModel in
                router.push(.noteDetail(noteModel))
            }
        )
        return NotesListViewModel(events: events)
    }
    
    private func makeAddNoteViewModel() -> AddNoteViewModel {
        let events = AddNoteViewModel.Events(
            close: {
                router.pop()
            }
        )
        return AddNoteViewModel(events: events)
    }
}

// Global setup function (can be moved to a separate file like AppSetup)
func setupDependencies() {
    let container = DIContainer.shared
    
    let network = NetworkService()
    let weatherService = WeatherService(network: network)
    let storage = UserDefaultsStorage()
    
    let repository = NotesRepository(weatherService: weatherService, storage: storage)
    
    container.register(NotesRepositoryType.self, service: repository)
    container.register(AppRouter.self, service: AppRouter())
}
