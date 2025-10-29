//
//  MyAccountViewModel.swift
//  FinanceHub
//
//  Created by Henry Lin on 2025/10/29.
//

import Foundation
import Combine

// MARK: - My Account ViewModel
/// ViewModel for the main account screen, handles all account-related data and operations
class MyAccountViewModel: BaseViewModel, ObservableObject {
    // MARK: - Published Properties
    @Published private(set) var messagesList = [Notification]()
    @Published private(set) var bannerList = [Banner]()
    @Published private(set) var favoriteList = [Favorite]()
    @Published private(set) var usdTotalAmount: Double?
    @Published private(set) var khrTotalAmount: Double?
    
    // MARK: - Notification Methods
    /// Fetches an empty notification list
    func getEmptyNotificationList() {
        setLoading(true)
        APIManager.shared.getEmptyNotificationList()
            .sink { [weak self] completion in
                guard let self = self else { return }
                if case .failure(let error) = completion {
                    self.handleError(error)
                    self.messagesList = []
                } else {
                    self.setLoading(false)
                }
            } receiveValue: { [weak self] data in
                guard let self = self else { return }
                self.messagesList = data.messages
            }
            .store(in: &cancellables)
    }

    /// Fetches the notification list
    func getNotificationList() {
        setLoading(true)
        APIManager.shared.getNotificationList()
            .sink { [weak self] completion in
                guard let self = self else { return }
                if case .failure(let error) = completion {
                    self.handleError(error)
                } else {
                    self.setLoading(false)
                }
            } receiveValue: { [weak self] data in
                guard let self = self else { return }
                self.messagesList = data.messages
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Account Balance Methods
    /// Fetches USD total amount using API set 1
    func getUsdTotalAmount1() {
        setLoading(true)
        fetchTotalAmount(
            savings: APIManager.shared.getUsdSavings1(),
            fixed: APIManager.shared.getUsdFixed1(),
            digital: APIManager.shared.getUsdDigital1()
        ) { [weak self] total in
            self?.usdTotalAmount = total
        }
    }

    /// Fetches KHR total amount using API set 1
    func getKhrTotalAmount1() {
        setLoading(true)
        fetchTotalAmount(
            savings: APIManager.shared.getKhrSavings1(),
            fixed: APIManager.shared.getKhrFixed1(),
            digital: APIManager.shared.getKhrDigital1()
        ) { [weak self] total in
            self?.khrTotalAmount = total
        }
    }

    /// Fetches USD total amount using API set 2 (without showing loading indicator)
    func getUsdTotalAmount2() {
        fetchTotalAmount(
            savings: APIManager.shared.getUsdSavings2(),
            fixed: APIManager.shared.getUsdFixed2(),
            digital: APIManager.shared.getUsdDigital2()
        ) { [weak self] total in
            self?.usdTotalAmount = total
        }
    }

    /// Fetches KHR total amount using API set 2 (without showing loading indicator)
    func getKhrTotalAmount2() {
        fetchTotalAmount(
            savings: APIManager.shared.getKhrSavings2(),
            fixed: APIManager.shared.getKhrFixed2(),
            digital: APIManager.shared.getKhrDigital2()
        ) { [weak self] total in
            self?.khrTotalAmount = total
        }
    }

    /// Helper method to fetch and calculate total amount from three account types
    private func fetchTotalAmount(
        savings: AnyPublisher<Saving, Error>,
        fixed: AnyPublisher<FixedDeposit, Error>,
        digital: AnyPublisher<Digital, Error>,
        completion: @escaping (Double) -> Void
    ) {
        Publishers.Zip3(savings, fixed, digital)
            .sink { [weak self] result in
                guard let self = self else { return }
                if case .failure(let error) = result {
                    self.handleError(error)
                } else {
                    self.setLoading(false)
                }
            } receiveValue: { savingsData, fixedData, digitalData in
                let accounts = savingsData.savingsList +
                              fixedData.fixedDepositList +
                              digitalData.digitalList
                let total = accounts.reduce(0) { $0 + $1.balance }
                completion(total)
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Banner Methods
    /// Fetches the banner list for promotional content
    func getBanner() {
        setLoading(true)
        APIManager.shared.getBanner()
            .sink { [weak self] completion in
                guard let self = self else { return }
                if case .failure(let error) = completion {
                    self.handleError(error)
                } else {
                    self.setLoading(false)
                }
            } receiveValue: { [weak self] data in
                guard let self = self else { return }
                self.bannerList = data.bannerList
            }
            .store(in: &cancellables)
    }

    // MARK: - Favorite Methods
    /// Fetches the user's favorite transaction list
    func getFavoriteList() {
        setLoading(true)
        APIManager.shared.getFavoriteList()
            .sink { [weak self] completion in
                guard let self = self else { return }
                if case .failure(let error) = completion {
                    self.handleError(error)
                } else {
                    self.setLoading(false)
                }
            } receiveValue: { [weak self] data in
                guard let self = self else { return }
                self.favoriteList = data.favoriteList
            }
            .store(in: &cancellables)
    }
}
