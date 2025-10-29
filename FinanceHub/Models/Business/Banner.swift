//
//  Banner.swift
//  FinanceHub
//
//  Created by Henry Lin on 2025/10/29.
//

import Foundation

// MARK: - Banner List Response
struct Banners: Codable, Hashable {
    let bannerList: [Banner]

    enum CodingKeys: String, CodingKey {
        case bannerList
    }
}

// MARK: - Banner Model
/// Represents a promotional banner with advertisement information
struct Banner: Codable, Hashable {
    let adSeqNo: Int
    let linkUrl: String

    enum CodingKeys: String, CodingKey {
        case adSeqNo
        case linkUrl
    }
}
