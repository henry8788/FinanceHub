//
//  Response.swift
//  FinanceHub
//
//  Created by Henry Lin on 2025/10/29.
//

import Foundation

// MARK: - Generic API Response
/// Generic wrapper for API responses
struct Response<T: Codable>: Codable {
    let msgCode: String?
    let msgContent: String?
    let result: T

    enum CodingKeys: String, CodingKey {
        case msgCode
        case msgContent
        case result
    }
}

// MARK: - Response Extensions
extension Response {
    /// Returns true if the response indicates success
    var isSuccess: Bool {
        msgCode == "0000" || msgCode == nil
    }

    /// Returns the error message if available
    var errorMessage: String? {
        guard !isSuccess else { return nil }
        return msgContent ?? "Unknown error occurred"
    }
}

