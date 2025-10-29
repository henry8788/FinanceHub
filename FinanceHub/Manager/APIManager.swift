//
//  APIManager.swift
//  FinanceHub
//
//  Created by Henry Lin on 2025/10/29.
//

import Foundation
import Combine

// MARK: - Network Error
enum NetworkError: Error, LocalizedError {
    case urlError
    case invalidResponse
    case decodingError

    var errorDescription: String? {
        switch self {
        case .urlError:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid server response"
        case .decodingError:
            return "Failed to decode response"
        }
    }
}

// MARK: - API Manager
/// Manages all API requests using Combine publishers
class APIManager {
    // MARK: - Singleton
    static let shared = APIManager()

    // MARK: - Properties
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()

    // MARK: - Initialization
    private init() {}

    // MARK: - Generic Request Method
    /// Generic method to make API requests
    func requestAPI<T: Codable>(url: String) -> AnyPublisher<T, Error> {
        guard let url = URL(string: url) else {
            return Fail(error: NetworkError.urlError).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    /// Helper method to unwrap Response<T> wrapper
    private func request<T: Codable>(_ endpoint: API) -> AnyPublisher<T, Error> {
        let publisher: AnyPublisher<Response<T>, Error> = requestAPI(url: endpoint.fullUrl)
        return publisher
            .map(\.result)
            .eraseToAnyPublisher()
    }
    
    // MARK: - Notification Endpoints
    func getEmptyNotificationList() -> AnyPublisher<Message, Error> {
        request(.getEmptyNotificationList)
    }

    func getNotificationList() -> AnyPublisher<Message, Error> {
        request(.getNotificationList)
    }

    // MARK: - USD Account Endpoints (Set 1)
    func getUsdSavings1() -> AnyPublisher<Saving, Error> {
        request(.getUsdSavings1)
    }

    func getUsdFixed1() -> AnyPublisher<FixedDeposit, Error> {
        request(.getUsdFixed1)
    }

    func getUsdDigital1() -> AnyPublisher<Digital, Error> {
        request(.getUsdDigital1)
    }

    // MARK: - KHR Account Endpoints (Set 1)
    func getKhrSavings1() -> AnyPublisher<Saving, Error> {
        request(.getKhrSavings1)
    }

    func getKhrFixed1() -> AnyPublisher<FixedDeposit, Error> {
        request(.getKhrFixed1)
    }

    func getKhrDigital1() -> AnyPublisher<Digital, Error> {
        request(.getKhrDigital1)
    }

    // MARK: - USD Account Endpoints (Set 2)
    func getUsdSavings2() -> AnyPublisher<Saving, Error> {
        request(.getUsdSavings2)
    }

    func getUsdFixed2() -> AnyPublisher<FixedDeposit, Error> {
        request(.getUsdFixed2)
    }

    func getUsdDigital2() -> AnyPublisher<Digital, Error> {
        request(.getUsdDigital2)
    }

    // MARK: - KHR Account Endpoints (Set 2)
    func getKhrSavings2() -> AnyPublisher<Saving, Error> {
        request(.getKhrSavings2)
    }

    func getKhrFixed2() -> AnyPublisher<FixedDeposit, Error> {
        request(.getKhrFixed2)
    }

    func getKhrDigital2() -> AnyPublisher<Digital, Error> {
        request(.getKhrDigital2)
    }

    // MARK: - Favorite Endpoints
    func getEmptyFavoriteList() -> AnyPublisher<Favorites, Error> {
        request(.getEmptyFavoriteList)
    }

    func getFavoriteList() -> AnyPublisher<Favorites, Error> {
        request(.getFavoriteList)
    }

    // MARK: - Banner Endpoints
    func getBanner() -> AnyPublisher<Banners, Error> {
        request(.getBanner)
    }
}

