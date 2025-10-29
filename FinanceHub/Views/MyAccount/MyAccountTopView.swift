//
//  MyAccountTopView.swift
//  FinanceHub
//
//  Created by Henry Lin on 2025/10/29.
//

import UIKit

protocol MyAccountTopViewDelegate:AnyObject {
    func goNotificationVC()
}

@IBDesignable
class MyAccountTopView: UIView, NibOwnerLoadable{
    
    // MARK: IBOutlets
    @IBOutlet weak var bellImageView: UIImageView!
    @IBOutlet weak var bellButton: UIButton!
    
    // MARK: - Properties
    weak var delegate:MyAccountTopViewDelegate?
    
    // MARK: - Initialier
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    func setBellImageView(messagesList:[Notification]) {
        bellImageView.image = UIImage(named: messagesList.isEmpty ? "iconBell01Nomal" : "iconBell02Active")
        bellButton.isEnabled = !messagesList.isEmpty
    }
    
    @IBAction func onBellBtnClick(_ sender: Any) {
        delegate?.goNotificationVC()
    }
}

// MARK: - private func
private extension MyAccountTopView {
    func customInit() {
        loadNibContent()
        
    }
}
