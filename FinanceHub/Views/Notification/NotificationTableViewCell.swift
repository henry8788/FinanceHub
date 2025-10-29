//
//  NotificationTableViewCell.swift
//  FinanceHub
//
//  Created by Henry Lin on 2025/10/29.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    
    // MARK: IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var updateDateTimeLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        statusView.clipsToBounds = true
        statusView.layer.cornerRadius = statusView.bounds.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setItem(item:Notification) {
        titleLabel.text = item.title
        statusView.isHidden = item.status
        updateDateTimeLabel.text = item.updateDateTime
        messageLabel.text = item.message
    }
    
}
