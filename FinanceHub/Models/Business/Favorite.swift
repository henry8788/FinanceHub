//
//  Favorite.swift
//  FinanceHub
//
//  Created by Henry Lin on 2025/10/29.
//

import Foundation

// MARK: - Favorite List Response
struct Favorites: Codable, Hashable {
    let favoriteList: [Favorite]

    enum CodingKeys: String, CodingKey {
        case favoriteList
    }
}

// MARK: - Favorite Model
/// Represents a favorite transaction item
struct Favorite: Codable, Hashable {
    let nickname: String
    let transType: String

    enum CodingKeys: String, CodingKey {
        case nickname
        case transType
    }
}

// MARK: - Transaction Type Enum
extension Favorite {
    enum TransactionType: String {
        case cubc = "CUBC"
        case mobile = "Mobile"
        case pmf = "PMF"
        case creditCard = "CreditCard"
        case unknown

        init(rawValue: String) {
            switch rawValue {
            case "CUBC": self = .cubc
            case "Mobile": self = .mobile
            case "PMF": self = .pmf
            case "CreditCard": self = .creditCard
            default: self = .unknown
            }
        }
    }

    var type: TransactionType {
        TransactionType(rawValue: transType)
    }
}
