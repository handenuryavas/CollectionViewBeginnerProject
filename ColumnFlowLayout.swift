//
//  ColumnFlowLayout.swift
//  CollectionViewBeginnerProject
//
//  Created by Hande Nur Yavaş on 10.02.2023.
//

import UIKit

class ColumnFlowLayout: UICollectionViewFlowLayout
{
    let numberOfColumns : Int
    var heightRatio : CGFloat = (3.0 / 2.0)
    
    init(numberOfColumns : Int, minnumberOfClomuns : CGFloat = 0, minlineSpacing : CGFloat = 0)
    {
        self.numberOfColumns = numberOfColumns
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implement")
    }
    override func prepare()
    {
        super.prepare()
        
        guard let collectionView = collectionView else {return}
        
        let interval = collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + minimumInteritemSpacing * CGFloat(numberOfColumns - 1)
        
        let elementWidth = ((collectionView.bounds.size.width - interval) / CGFloat(numberOfColumns)).rounded(.down)
        
        let elementHeight = elementWidth * heightRatio
        
        itemSize = CGSize(width: elementWidth, height: elementHeight)
    }
}
