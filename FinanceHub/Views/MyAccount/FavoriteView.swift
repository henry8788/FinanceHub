//
//  FavoriteView.swift
//  FinanceHub
//
//  Created by Henry Lin on 2025/10/29.
//

import UIKit

@IBDesignable
class FavoriteView: UIView, NibOwnerLoadable{
    
    // MARK: IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var favoriteList:[Favorite] = []
    
    // MARK: - Initialier
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    func setFavoriteList(list:[Favorite]) {
        self.favoriteList = list
        collectionView.reloadData()
    }
    
}

// MARK: - private func
private extension FavoriteView {
    func customInit() {
        loadNibContent()
        
        self.collectionView.register(UINib(nibName:
                                            "FavoriteCollectionViewCell", bundle:nil),
                                     forCellWithReuseIdentifier: "favoriteCollectionViewCell")
        
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.reloadData()
        
    }
    
    func itemAt(indexPath:IndexPath) -> Favorite?{
        guard indexPath.row >= 0 && indexPath.row < favoriteList.count else{
            return nil
        }
        return favoriteList[indexPath.row]
    }
}

// MARK: CollectionViewDataSource, UICollectionViewDelegate
extension FavoriteView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteList.count
    }
    
    ///  設定 CollectionViewCell 的寬、高
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.collectionView.bounds.size.width - 40)/4
        return CGSize(width:width, height:88)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoriteCollectionViewCell", for:
                                                                indexPath) as? FavoriteCollectionViewCell else { return UICollectionViewCell()}
        
        if let item = itemAt(indexPath: indexPath) {
            cell.setItem(item: item)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
}




