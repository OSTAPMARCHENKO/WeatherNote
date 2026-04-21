//
//  Date+Format.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import Foundation

extension Date {
    private static let noteDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
    
    func formattedForNote() -> String {
        return Date.noteDateFormatter.string(from: self)
    }
}
