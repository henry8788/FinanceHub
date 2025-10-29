//
//  BaseViewController.swift
//  FinanceHub
//
//  Created by Henry Lin on 2025/10/29.
//

import UIKit
import Combine

// MARK: - Base View Controller
/// Base class for all view controllers providing common functionality
class BaseViewController: UIViewController {
    // MARK: - Properties
    var cancellables = Set<AnyCancellable>()
    private(set) var loadingView = UIActivityIndicatorView(style: .large)

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupLoadingView()
    }

    deinit {
        cancellables.removeAll()
    }

    // MARK: - Setup Methods
    private func setupNavigationBar() {
        navigationItem.backButtonDisplayMode = .minimal
        setLeftNavigationBarItems()
    }

    private func setupLoadingView() {
        loadingView.center = view.center
        loadingView.hidesWhenStopped = true
        view.addSubview(loadingView)
    }

    // MARK: - Loading Methods
    func startLoadingView() {
        view.bringSubviewToFront(loadingView)
        loadingView.startAnimating()
    }

    func stopLoadingView() {
        loadingView.stopAnimating()
    }

    // MARK: - Navigation Bar Methods
    func setLeftNavigationBarItems() {
        let backButton = createBackButton()
        let barButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItems = [barButtonItem]
    }

    private func createBackButton() -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        button.setImage(UIImage(named: "iconArrowWTailBack"), for: .normal)
        button.widthAnchor.constraint(equalToConstant: 24).isActive = true
        button.heightAnchor.constraint(equalToConstant: 24).isActive = true
        button.addTarget(self, action: #selector(onBarBackButtonClicked), for: .touchUpInside)
        return button
    }

    @objc private func onBarBackButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
}



