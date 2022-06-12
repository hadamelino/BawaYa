//
//  CollectionItemsTableViewCell.swift
//  BawaYa_DesignRevised
//
//  Created by Hada Melino Muhammad on 11/06/22.
//

import UIKit

class CollectionItemsTableViewCell: UITableViewCell {
    
    let collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isScrollEnabled = false
        return collection
    }()
    
    var height: CGFloat = 0.0

    override func layoutSubviews() {
        super.layoutSubviews()
        
        height = collectionView.collectionViewLayout.collectionViewContentSize.height
        collectionView.heightAnchor.constraint(equalToConstant: height).isActive = true
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(greaterThanOrEqualTo: contentView.bottomAnchor).isActive = true
        collectionView.invalidateIntrinsicContentSize()

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        collectionView.register(ItemsCollectionViewCell.self, forCellWithReuseIdentifier: "itemCollectionViewCell")

        contentView.addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

