//
//  NotificationViewController.swift
//  FinanceHub
//
//  Created by Henry Lin on 2025/10/29.
//

import UIKit

// MARK: - Notification View Controller
/// Displays a list of user notifications
class NotificationViewController: BaseViewController {
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    private var items: [Notification] = []
    private var dataSource: NotificationTableViewDataSource?

    // MARK: - Initialization
    init(list: [Notification]) {
        self.items = list
        super.init(nibName: "NotificationViewController", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }

    // MARK: - Public Methods
    func showNotificationList(list: [Notification]) {
        items = list
        dataSource?.items = list
        tableView.reloadData()
    }
}

// MARK: - Setup
private extension NotificationViewController {
    func setupUI() {
        title = "Notification"
    }

    func setupTableView() {
        let nib = UINib(nibName: "NotificationTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "NotificationTableViewCell")

        dataSource = NotificationTableViewDataSource(
            items: items,
            itemIdentifier: "NotificationTableViewCell"
        )
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
    }
}
