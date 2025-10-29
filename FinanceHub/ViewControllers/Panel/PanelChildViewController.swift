//
//  PanelChildViewController.swift
//  FinanceHub
//
//  Created by Henry Lin on 2025/10/29.
//

import UIKit

// MARK: - Panel Child Page Enum
enum PanelChildPage {
    case home
    case account
    case location
    case service
}

// MARK: - Panel Child View Controller
/// Container view controller managing tab-based navigation between child view controllers
class PanelChildViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var tabbarView: UIView!

    // MARK: - Properties
    private var currentPage: PanelChildPage?
    private var homeChildController: MyAccountViewController?

    // MARK: - Initialization
    init() {
        super.init(nibName: "PanelChildViewController", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        if currentPage == nil {
            showHomePage()
        }
        Style.Shadow.setDefaultShadow(view: tabbarView, cornerRadius: 25)
    }

    private func showHomePage() {
        guard currentPage != .home else { return }

        if homeChildController == nil {
            homeChildController = MyAccountViewController()
            if let viewController = homeChildController {
                addChild(viewController)
            }
        }
        showPageView(page: .home)
    }

    private func showPageView(page: PanelChildPage) {
        let relatedVC: UIViewController?

        switch page {
        case .home, .account, .location, .service:
            relatedVC = homeChildController
        }

        guard let viewController = relatedVC,
              children.contains(viewController) else {
            return
        }

        clearContentView()
        viewController.view.frame = contentView.bounds
        contentView.addSubview(viewController.view)
        viewController.didMove(toParent: self)

        currentPage = page
        view.layoutIfNeeded()
    }

    private func clearContentView() {
        contentView.subviews.forEach { $0.removeFromSuperview() }
    }
}
