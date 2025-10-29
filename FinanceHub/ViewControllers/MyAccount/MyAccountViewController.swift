//
//  MyAccountViewController.swift
//  FinanceHub
//
//  Created by Henry Lin on 2025/10/29.
//

import UIKit
import Combine

// MARK: - My Account View Controller
/// Main account screen displaying balances, banners, and favorite transactions
class MyAccountViewController: BaseViewController {
    // MARK: - IBOutlets
    @IBOutlet private weak var myAccountTopView: MyAccountTopView!
    @IBOutlet private weak var paymentMethodView: PaymentMethodView!
    @IBOutlet private weak var myScrollingView: UIScrollView!
    @IBOutlet private weak var accountBalanceView: AccountBalanceView!
    @IBOutlet private weak var bannerView: BannerView!
    @IBOutlet private weak var bannerEmptyView: BannerEmptyView!
    @IBOutlet private weak var favoriteView: FavoriteView!
    @IBOutlet private weak var favoriteEmptyView: FavoriteEmptyView!

    // MARK: - Properties
    private let viewModel = MyAccountViewModel()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
        loadInitialData()
    }

    // MARK: - Setup Methods
    private func setupUI() {
        configureBannerVisibility(shouldShow: false)
        configureFavoriteVisibility(shouldShow: false)
        myScrollingView.bounces = true
        myAccountTopView.delegate = self
        configureRefreshControl()
    }

    private func configureBannerVisibility(shouldShow: Bool) {
        bannerView.isHidden = !shouldShow
        bannerEmptyView.isHidden = shouldShow
    }

    private func configureFavoriteVisibility(shouldShow: Bool) {
        favoriteView.isHidden = !shouldShow
        favoriteEmptyView.isHidden = shouldShow
    }

    private func loadInitialData() {
        startLoadingView()
        viewModel.getEmptyNotificationList()
        viewModel.getUsdTotalAmount1()
        viewModel.getKhrTotalAmount1()
        viewModel.getFavoriteList()
    }
}

// MARK: - Bindings
private extension MyAccountViewController {
    func setupBindings() {
        bindLoadingState()
        bindNotifications()
        bindAccountBalances()
        bindBanners()
        bindFavorites()
    }

    func bindLoadingState() {
        viewModel.$loadingEvent
            .receive(on: DispatchQueue.main)
            .sink { [weak self] loadingEvent in
                loadingEvent.isLoading ? self?.startLoadingView() : self?.stopLoadingView()
            }
            .store(in: &cancellables)
    }

    func bindNotifications() {
        viewModel.$messagesList
            .receive(on: DispatchQueue.main)
            .sink { [weak self] messagesList in
                self?.myAccountTopView.setBellImageView(messagesList: messagesList)
            }
            .store(in: &cancellables)
    }

    func bindAccountBalances() {
        viewModel.$usdTotalAmount
            .receive(on: DispatchQueue.main)
            .compactMap { $0 }
            .sink { [weak self] amount in
                let formattedAmount = String(amount).thousandths
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self?.accountBalanceView.setUsdTotalAmount(total: formattedAmount)
                }
            }
            .store(in: &cancellables)

        viewModel.$khrTotalAmount
            .receive(on: DispatchQueue.main)
            .compactMap { $0 }
            .sink { [weak self] amount in
                let formattedAmount = String(amount).thousandths
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self?.accountBalanceView.setKhrTotalAmount(total: formattedAmount)
                }
            }
            .store(in: &cancellables)
    }

    func bindBanners() {
        viewModel.$bannerList
            .receive(on: DispatchQueue.main)
            .sink { [weak self] bannerList in
                self?.bannerView.setBanner(list: bannerList)
            }
            .store(in: &cancellables)
    }

    func bindFavorites() {
        viewModel.$favoriteList
            .receive(on: DispatchQueue.main)
            .sink { [weak self] favoriteList in
                self?.favoriteView.setFavoriteList(list: favoriteList)
            }
            .store(in: &cancellables)
    }
}

// MARK: - Refresh Control
private extension MyAccountViewController {
    func configureRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
        myScrollingView.refreshControl = refreshControl
    }

    @objc func handleRefreshControl() {
        accountBalanceView.showShimmer()
        configureBannerVisibility(shouldShow: true)
        configureFavoriteVisibility(shouldShow: true)

        viewModel.getBanner()
        viewModel.getFavoriteList()
        viewModel.getNotificationList()
        viewModel.getUsdTotalAmount2()
        viewModel.getKhrTotalAmount2()

        DispatchQueue.main.async { [weak self] in
            self?.myScrollingView.refreshControl?.endRefreshing()
        }
    }
}

// MARK: - MyAccountTopViewDelegate
extension MyAccountViewController: MyAccountTopViewDelegate {
    func goNotificationVC() {
        let notificationVC = NotificationViewController(list: viewModel.messagesList)
        navigationController?.pushViewController(notificationVC, animated: true)
    }
}
