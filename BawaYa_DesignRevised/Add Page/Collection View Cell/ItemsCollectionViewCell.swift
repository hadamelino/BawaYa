//
//  ItemsCollectionViewCell.swift
//  BawaYa_DesignRevised
//
//  Created by Hada Melino Muhammad on 11/06/22.
//

import UIKit

class ItemsCollectionViewCell: UICollectionViewCell {
    
    let cellBg: UIView = {
        let theView = UIView()
        theView.translatesAutoresizingMaskIntoConstraints = false
        theView.backgroundColor = UIColor(named: "customGrey")
        theView.layer.cornerRadius = 8
        return theView
    }()
    
    let itemLabel: UILabel = {
        let theLabel = UILabel()
        theLabel.translatesAutoresizingMaskIntoConstraints = false
        theLabel.text = "Bottle"
        return theLabel
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
                
        contentView.addSubview(cellBg)
        contentView.addSubview(itemLabel)
        
        cellBg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        cellBg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        cellBg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        cellBg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        itemLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        itemLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
