//
//  Notification.swift
//  FinanceHub
//
//  Created by Henry Lin on 2025/10/29.
//

import Foundation

// MARK: - Message List Response
struct Message: Codable, Hashable {
    let messages: [Notification]

    enum CodingKeys: String, CodingKey {
        case messages
    }
}

// MARK: - Notification Model
/// Represents a user notification message
/// Note: Named "Notification" to match API response, but distinct from Foundation.Notification
struct Notification: Codable, Hashable {
    let status: Bool
    let updateDateTime: String
    let title: String
    let message: String

    enum CodingKeys: String, CodingKey {
        case status
        case updateDateTime
        case title
        case message
    }
}

// MARK: - Notification Extensions
extension Notification {
    /// Returns true if the notification has been read
    var isRead: Bool {
        status
    }

    /// Returns true if the notification is unread
    var isUnread: Bool {
        !status
    }

    /// Formatted date from updateDateTime string
    var formattedDate: String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        if let date = formatter.date(from: updateDateTime) {
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
            return formatter.string(from: date)
        }
        return nil
    }
}

