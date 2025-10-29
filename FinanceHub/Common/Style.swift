//
//  Style.swift
//  FinanceHub
//
//  Created by Henry Lin on 2025/10/29.
//

import UIKit

// MARK: - Style Utilities
/// Provides styling utilities for UI components
struct Style {
    // MARK: - Round Corner
    struct RoundCorner {
        /// Applies rounded corners with border to a view
        /// - Parameters:
        ///   - view: The view to style
        ///   - radius: Corner radius
        ///   - color: Border color
        static func setRoundCorner(view: UIView, radius: CGFloat, color: CGColor) {
            view.layer.borderColor = color
            view.clipsToBounds = true
            view.layer.cornerRadius = radius
        }
    }

    // MARK: - Shadow
    struct Shadow {
        // Default shadow properties
        private static let defaultMaskToBounds = false
        private static let defaultColor: CGColor = UIColor.black.cgColor
        private static let defaultOpacity: Float = 0.2
        private static let defaultRadius: CGFloat = 3
        private static let defaultOffset = CGSize(width: 4, height: 4)

        /// Applies default shadow with corner radius to a view
        /// - Parameters:
        ///   - view: The view to style
        ///   - cornerRadius: Corner radius for the view
        static func setDefaultShadow(view: UIView, cornerRadius: CGFloat) {
            view.layer.masksToBounds = defaultMaskToBounds
            view.layer.shadowColor = defaultColor
            view.layer.shadowRadius = defaultRadius
            view.layer.shadowOffset = defaultOffset
            view.layer.shadowOpacity = defaultOpacity
            view.layer.cornerRadius = cornerRadius
        }

        /// Applies custom shadow to a view
        /// - Parameters:
        ///   - view: The view to style
        ///   - color: Shadow color
        ///   - opacity: Shadow opacity (0.0 - 1.0)
        ///   - radius: Shadow blur radius
        ///   - offset: Shadow offset
        ///   - cornerRadius: Corner radius for the view
        static func setCustomShadow(
            view: UIView,
            color: CGColor = defaultColor,
            opacity: Float = defaultOpacity,
            radius: CGFloat = defaultRadius,
            offset: CGSize = defaultOffset,
            cornerRadius: CGFloat
        ) {
            view.layer.masksToBounds = false
            view.layer.shadowColor = color
            view.layer.shadowRadius = radius
            view.layer.shadowOffset = offset
            view.layer.shadowOpacity = opacity
            view.layer.cornerRadius = cornerRadius
        }
    }
}
