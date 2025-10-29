//
//  AccountBalanceView.swift
//  FinanceHub
//
//  Created by Henry Lin on 2025/10/29.
//

import UIKit

@IBDesignable
class AccountBalanceView: UIView, NibOwnerLoadable{
    
    // MARK: IBOutlets
    
    @IBOutlet weak var khrView: ShimmerView!
    @IBOutlet weak var usdView: ShimmerView!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var khrLabel: UILabel!
    @IBOutlet weak var eyesButton: UIButton!
    @IBOutlet weak var eyesImageView: UIImageView!
    
    var usdTotalStr = ""
    var khrTotalStr = ""
    
    // MARK: - Initialier
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    @IBAction func onEyeBtnClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        eyesImageView.image = eyesButton.isSelected ? UIImage(named: "iconEye02Off") : UIImage(named: "iconEye01On")
        usdLabel.text = eyesButton.isSelected ? "********" : usdTotalStr
        khrLabel.text = eyesButton.isSelected ? "********" : khrTotalStr
        
    }
    
    func setUsdTotalAmount(total:String) {
        usdTotalStr = total
        usdLabel.text = total
        usdView.isHidden = true
        usdLabel.isHidden = false
        
    }
    
    func setKhrTotalAmount(total:String) {
        khrTotalStr = total
        khrLabel.text = total
        khrView.isHidden = true
        khrLabel.isHidden = false
        
    }
    
    func showShimmer() {
        usdView.isHidden = false
        usdLabel.isHidden = true
        khrView.isHidden = false
        khrLabel.isHidden = true
    }
}

// MARK: - private func
private extension AccountBalanceView {
    func customInit() {
        loadNibContent()
        eyesButton.imageView?.contentMode = .scaleAspectFit
        showShimmer()
        usdView.startAnimating()
        khrView.startAnimating()
    }
}

