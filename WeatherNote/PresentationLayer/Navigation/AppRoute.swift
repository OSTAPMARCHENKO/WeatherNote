//
//  AppRoute.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import Combine
import SwiftUI

// All possible navigation destinations
enum AppRoute: Hashable {
    case addNote
    case noteDetail(NoteModel)
}

final class AppRouter: ObservableObject {
    @Published var path = NavigationPath()
    
    // Push new screen to the stack
    func push(_ route: AppRoute) {
        path.append(route)
    }
    
    // Go back to the previous screen
    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    // Go back to the root screen
    func popToRoot() {
        path.removeLast(path.count)
    }
}
