//
//  DIContainer.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import Foundation

final class DIContainer {
    static let shared = DIContainer()
    private init() {}
    
    private var services: [String: Any] = [:]
    
    // Register a specific service
    func register<T>(_ type: T.Type, service: Any) {
        let key = String(describing: type)
        services[key] = service
    }
    
    // Resolve and get the service
    func resolve<T>(_ type: T.Type) -> T {
        let key = String(describing: type)
        guard let service = services[key] as? T else {
            fatalError("Dependency \(T.self) is not registered!")
        }
        return service
    }
}
