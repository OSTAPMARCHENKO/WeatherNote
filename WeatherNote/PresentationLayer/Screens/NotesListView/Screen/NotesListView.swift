//
//  NotesListView.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import SwiftUI

struct NotesListView<ViewModel: NotesListViewModelType>: View {
    @StateObject private var viewModel: ViewModel
  
    // MARK: - Lifecycle
    
    init(viewModel: @autoclosure @escaping () -> ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel())
    }
    
    
    var body: some View {
        Group {
            if viewModel.notes.isEmpty {
                emptyStateView
            } else {
                List(viewModel.notes) { note in
                    NoteCellView(note: note, dateString: viewModel.formatDate(note.createdAt))
                        .contentShape(Rectangle())
                        .onTapGesture {
                            viewModel.selectNote(note)
                        }
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Weather Notes")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    viewModel.addNewNote()
                }) {
                    Image(systemName: "square.and.pencil")
                }
            }
        }
        .onAppear {
            viewModel.loadData()
        }
    }
    
    private var emptyStateView: some View {
        VStack(spacing: 16) {
            Image(systemName: "note.text")
                .font(.system(size: 48))
                .foregroundColor(.secondary)
            Text("No notes yet.\nTap + to add your first note!")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}
