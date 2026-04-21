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
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
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
