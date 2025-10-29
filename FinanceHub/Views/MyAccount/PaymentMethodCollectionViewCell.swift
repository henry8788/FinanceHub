//
//  PaymentMethodCollectionViewCell.swift
//  FinanceHub
//
//  Created by Henry Lin on 2025/10/29.
//

import UIKit

class PaymentMethodCollectionViewCell: UICollectionViewCell {
    
    // MARK: IBOutlets
    @IBOutlet weak var paymentImageView: UIImageView!
    @IBOutlet weak var paymentTitleLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setItem(item:PaymentMethod) {
        paymentImageView.image = UIImage(named: item.imageStr)
        paymentTitleLabel.text = item.imageTitle
        
    }

}
