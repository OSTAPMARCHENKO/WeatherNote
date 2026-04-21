//
//  NoteCellView.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import SwiftUI

struct NoteCellView<Model: NoteListNoteModelType>: View {
    let model: Model
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading, spacing: 6) {
                Text(model.titleText)
                    .font(.headline)
                    .lineLimit(2)
                
                Text(model.dateString)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            if model.hasWeather, let temp = model.temperatureString {
                VStack(alignment: .trailing, spacing: 4) {
                    Text(temp)
                        .font(.subheadline.bold())
                    
                    Image(systemName: "cloud.sun.fill")
                        .foregroundColor(.orange)
                        .font(.title3)
                }
            }
        }
        .padding(.vertical, 4)
    }
}
