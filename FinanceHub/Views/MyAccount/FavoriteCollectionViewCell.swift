//
//  FavoriteCollectionViewCell.swift
//  FinanceHub
//
//  Created by Henry Lin on 2025/10/29.
//

import UIKit

enum TransType:String {
    case CUBC = "CUBC"
    case Mobile = "Mobile"
    case PMF = "PMF"
    case CreditCard = "CreditCard"
    
    var iconName:String {
        switch self {
        case .CUBC:
            return "button00ElementScrollTree"
        case .Mobile:
            return "button00ElementScrollMobile"
        case.PMF:
            return "button00ElementScrollBuilding"
        case.CreditCard:
            return "button00ElementScrollCreditCard"
        }
    }
}

class FavoriteCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setItem(item:Favorite) {
        iconImageView.image = UIImage(named: TransType(rawValue: item.transType)?.iconName ?? "button00ElementScrollTree")
        nicknameLabel.text = item.nickname
    }

}
