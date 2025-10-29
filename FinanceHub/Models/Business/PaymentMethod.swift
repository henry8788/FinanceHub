//
//  PaymentMethod.swift
//  FinanceHub
//
//  Created by Henry Lin on 2025/10/29.
//

import Foundation

// MARK: - Payment Method Model
/// Represents a payment method option with icon and title
struct PaymentMethod: Hashable {
    let imageStr: String
    let imageTitle: String
}

// MARK: - Payment Method Type
extension PaymentMethod {
    enum MethodType: String {
        case transfer = "Transfer"
        case payment = "Payment"
        case utility = "Utility"
        case qrPayScan = "QR pay scan"
        case myQRCode = "My QR code"
        case topUp = "Top up"
    }

    /// Convenience initializer with method type
    init(type: MethodType, imageName: String) {
        self.imageStr = imageName
        self.imageTitle = type.rawValue
    }
}
