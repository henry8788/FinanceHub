//
//  BottomView.swift
//  FinanceHub
//
//  Created by Henry Lin on 2025/10/29.
//
import UIKit

@IBDesignable
class BottomView: UIView, NibOwnerLoadable{
    
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
private extension BottomView {
    func customInit() {
        loadNibContent()
    }
}
