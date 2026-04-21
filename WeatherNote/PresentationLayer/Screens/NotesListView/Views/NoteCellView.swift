//
//  NoteCellView.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import SwiftUI

struct NoteCellView: View {
    var titleText: String
    var dateString: String
    var temperatureString: String?
    var hasWeather: Bool
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading, spacing: 6) {
                Text(titleText)
                    .font(.headline)
                    .lineLimit(2)
                
                Text(dateString)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            if hasWeather, let temp = temperatureString {
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
