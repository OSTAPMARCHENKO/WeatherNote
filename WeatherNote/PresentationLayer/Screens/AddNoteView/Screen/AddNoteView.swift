//
//  AddNoteView.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import SwiftUI

struct AddNoteView<ViewModel: AddNoteViewModelType>: View {
    
    // MARK: - Properties(Private)

    @FocusState private var isEditorFocused: Bool

    @StateObject private var viewModel: ViewModel
  
    // MARK: - Lifecycle
    
    init(viewModel: @autoclosure @escaping () -> ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel())
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            headerLabel
            
            noteEditor
            
            if let error = viewModel.errorMessage {
                errorLabel(error)
            }
            
            Spacer()
        }
        .padding()
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        .navigationTitle("New Note")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            navigationToolbar
        }
        .onAppear {
            isEditorFocused = true
        }
    }
    
    // MARK: - Subviews
    
    private var headerLabel: some View {
        Text("What's on your mind?")
            .font(.subheadline)
            .foregroundColor(.secondary)
    }
    
    private var noteEditor: some View {
        TextEditor(text: $viewModel.dataModel.text)
            .focused($isEditorFocused)
            .padding(12)
            .background(Color(.secondarySystemGroupedBackground))
            .cornerRadius(12)
            .frame(minHeight: 200)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.secondary.opacity(0.2), lineWidth: 1)
            )
    }
    
    private func errorLabel(_ message: String) -> some View {
        Text(message)
            .font(.caption)
            .foregroundColor(.orange)
            .padding(.horizontal)
            .transition(.move(edge: .top).combined(with: .opacity))
    }
    
    // MARK: - Toolbar
    
    @ToolbarContentBuilder
    private var navigationToolbar: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button("Cancel") {
                viewModel.cancel()
            }
            .disabled(viewModel.isLoading)
        }
        
        ToolbarItem(placement: .navigationBarTrailing) {
            if viewModel.isLoading {
                ProgressView()
            } else {
                Button("Save") {
                    viewModel.saveNote()
                }
                .fontWeight(.bold)
                .disabled(!viewModel.dataModel.isValid)
            }
        }
    }
}
