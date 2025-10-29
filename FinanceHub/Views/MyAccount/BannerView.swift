//
//  BannerView.swift
//  FinanceHub
//
//  Created by Henry Lin on 2025/10/29.
//

import UIKit

@IBDesignable
class BannerView: UIView, NibOwnerLoadable{
    
    // MARK: IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pages: UIPageControl!
    
    var items:[Banner] = []
    var index = 0
    
    // MARK: - Initialier
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    func setBanner(list:[Banner]) {
        items = list
        collectionView.reloadData()
    }
}

// MARK: - private func
private extension BannerView {
    func customInit() {
        
        loadNibContent()
        
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(pageSetup), userInfo: nil, repeats: true)
        
        self.collectionView.register(UINib(nibName:
                                            "BannerCollectionViewCell", bundle:nil),
                                     forCellWithReuseIdentifier: "bannerCollectionViewCell")
        
        Style.RoundCorner.setRoundCorner(view: collectionView, radius: 12, color: UIColor.white.cgColor)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
    }
    
    @objc func pageSetup(){
        if index < items.count - 1 {
            index = index + 1
        }else {
            index = 0
        }
        pages.numberOfPages = items.count
        pages.currentPage = index
        collectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .right, animated: true)
        
    }
    
    func itemAt(indexPath:IndexPath) -> Banner?{
        guard indexPath.row >= 0 && indexPath.row < items.count else{
            return nil
        }
        return items[indexPath.row]
    }
}

// MARK: CollectionViewDataSource, UICollectionViewDelegate
extension BannerView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.isEmpty ? 1 : items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bannerCollectionViewCell", for:
                                                                indexPath) as? BannerCollectionViewCell else { return UICollectionViewCell()}
        if let item = itemAt(indexPath: indexPath) {
            cell.setItem(item: item)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}


