//
//  NoteDetailView.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import SwiftUI

struct NoteDetailView<ViewModel: NoteDetailViewModelType>: View {
    @StateObject private var viewModel: ViewModel
  
    // MARK: - Lifecycle
    
    init(viewModel: @autoclosure @escaping () -> ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel())
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Weather Card
                if viewModel.dataModel.hasWeather {
                    weatherCard
                }
                
                // Note Text Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("NOTE")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Text(viewModel.dataModel.text)
                        .font(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(12)
                }
            }
            .padding()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // Extracted view for cleaner body
    private var weatherCard: some View {
        HStack(spacing: 16) {
            Image(systemName: "cloud.sun.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.orange)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(viewModel.dataModel.locationName)
                    .font(.headline)
                Text(viewModel.dataModel.dateString)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text(viewModel.dataModel.temperature)
                    .font(.title2.bold())
                Text(viewModel.dataModel.weatherDescription)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(16)
    }
}
