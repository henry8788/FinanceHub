//
//  BannerEmptyView.swift
//  FinanceHub
//
//  Created by Henry Lin on 2025/10/29.
//

import UIKit

@IBDesignable
class BannerEmptyView: UIView, NibOwnerLoadable{
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var contentSubView: UIView!
    
    // MARK: - Initialier
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
}

// MARK: - private func
private extension BannerEmptyView {
    func customInit() {
        loadNibContent()
        Style.RoundCorner.setRoundCorner(view: contentView, radius: 12, color: UIColor.white.cgColor)
        Style.RoundCorner.setRoundCorner(view: contentSubView, radius: 6, color: UIColor.white.cgColor)
    }
}


