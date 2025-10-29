//
//  Extension_String.swift
//  FinanceHub
//
//  Created by Henry Lin on 2025/10/29.
//

import Foundation

// MARK: - String Extensions
extension String {
    /// Formats a string as a number with thousands separator and 2 decimal places
    /// Example: "1234567.89" -> "1,234,567.89"
    var thousandths: String {
        guard let doubleValue = Double(self) else {
            return self
        }

        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.usesGroupingSeparator = true
        formatter.roundingMode = .down

        return formatter.string(from: NSNumber(value: doubleValue)) ?? self
    }

    /// Validates if string is a valid number
    var isNumeric: Bool {
        Double(self) != nil
    }

    /// Converts string to Double safely
    var toDouble: Double? {
        Double(self)
    }
}
