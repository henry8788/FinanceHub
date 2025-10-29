//
//  BaseViewModel.swift
//  FinanceHub
//
//  Created by Henry Lin on 2025/10/29.
//

import Foundation
import Combine

// MARK: - Loading State Enum
enum LoadingEvent {
    case loading
    case stopped

    var isLoading: Bool {
        self == .loading
    }
}

// MARK: - Base ViewModel
/// Base class for all ViewModels providing common functionality
class BaseViewModel {
    // MARK: - Published Properties
    @Published var errorMessage: String?
    @Published var loadingEvent: LoadingEvent = .stopped

    // MARK: - Properties
    var cancellables = Set<AnyCancellable>()

    // MARK: - Lifecycle
    deinit {
        cancellables.removeAll()
    }

    // MARK: - Helper Methods
    /// Clears the current error message
    func clearError() {
        errorMessage = nil
    }

    /// Sets the loading state
    func setLoading(_ isLoading: Bool) {
        loadingEvent = isLoading ? .loading : .stopped
    }

    /// Handles error from API call
    func handleError(_ error: Error) {
        errorMessage = error.localizedDescription
        loadingEvent = .stopped
    }
}
