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
        //view.backgroundColor = UIColor(named: "colorPallete")
        view.layer.cornerRadius = 12
        return view
    }()
    
    var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        //label.backgroundColor = .systemGray
        label.text = "3"
        return label
    }()
    
    var dayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.text = ""
       return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(bgView)
        contentView.addSubview(dateLabel)
        contentView.addSubview(dayLabel)
        
        bgView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        
        dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: dayLabel.topAnchor, constant: 10).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true

        dayLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10).isActive = true
        dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        dayLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
