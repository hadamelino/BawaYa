//
//  DateCollectionViewCell.swift
//  BawaYa_DesignRevised
//
//  Created by Hada Melino Muhammad on 07/06/22.
//

import UIKit

class DateCollectionViewCell: UICollectionViewCell {
    
    let bgView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "colorPallete")
        view.layer.cornerRadius = 12
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(bgView)
        bgView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
