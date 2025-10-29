//
//  PaymentMethodView.swift
//  FinanceHub
//
//  Created by Henry Lin on 2025/10/29.
//

import UIKit

@IBDesignable
class PaymentMethodView: UIView, NibOwnerLoadable{
    
    // MARK: IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var paymentMethodList:[PaymentMethod] = []
    
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
private extension PaymentMethodView {
    func customInit() {
        
        loadNibContent()
        
        paymentMethodList = [PaymentMethod(imageStr: "button00ElementMenuTransfer", imageTitle: "Transfer"),
                             PaymentMethod(imageStr: "button00ElementMenuPayment", imageTitle: "Payment"),
                             PaymentMethod(imageStr: "button00ElementMenuUtility", imageTitle: "Utility"),
                             PaymentMethod(imageStr: "button01Scan", imageTitle: "QR pay sscan"),
                             PaymentMethod(imageStr: "button00ElementMenuQRcode", imageTitle: "My QR code"),
                             PaymentMethod(imageStr: "button00ElementMenuTopUp", imageTitle: "Top up"),
        ]
        
        self.collectionView.register(UINib(nibName:
                                            "PaymentMethodCollectionViewCell", bundle:nil),
                                     forCellWithReuseIdentifier: "paymentMethodCollectionViewCell")
        
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.reloadData()
        
    }
    
    func itemAt(indexPath:IndexPath) -> PaymentMethod?{
        guard indexPath.row >= 0 && indexPath.row < paymentMethodList.count else{
            return nil
        }
        return paymentMethodList[indexPath.row]
    }
    
}

// MARK: CollectionViewDataSource, UICollectionViewDelegate
extension PaymentMethodView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return paymentMethodList.count
    }
    
    ///  設定 CollectionViewCell 的寬、高
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.collectionView.bounds.size.width - 40)/3
        return CGSize(width:width, height:96)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "paymentMethodCollectionViewCell", for:
                                                                indexPath) as? PaymentMethodCollectionViewCell else { return UICollectionViewCell()}
        
        if let item = itemAt(indexPath: indexPath) {
            cell.setItem(item: item)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
}


