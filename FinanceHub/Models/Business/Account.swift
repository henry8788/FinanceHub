//
//  Account.swift
//  FinanceHub
//
//  Created by Henry Lin on 2025/10/29.
//

import Foundation

// MARK: - Saving Account List Response
struct Saving: Codable, Hashable {
    let savingsList: [Account]

    enum CodingKeys: String, CodingKey {
        case savingsList
    }
}

// MARK: - Fixed Deposit Account List Response
struct FixedDeposit: Codable, Hashable {
    let fixedDepositList: [Account]

    enum CodingKeys: String, CodingKey {
        case fixedDepositList
    }
}

// MARK: - Digital Account List Response
struct Digital: Codable, Hashable {
    let digitalList: [Account]

    enum CodingKeys: String, CodingKey {
        case digitalList
    }
}

// MARK: - Account Model
/// Represents a bank account with balance information
struct Account: Codable, Hashable {
    let account: String
    let curr: String
    let balance: Double

    enum CodingKeys: String, CodingKey {
        case account
        case curr
        case balance
    }
}

// MARK: - Account Extensions
extension Account {
    /// Formatted balance with currency symbol
    var formattedBalance: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = curr
        return formatter.string(from: NSNumber(value: balance)) ?? "\(balance)"
    }
}
