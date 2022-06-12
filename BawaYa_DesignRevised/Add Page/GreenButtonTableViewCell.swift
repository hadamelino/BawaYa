//
//  greenButtonTableViewCell.swift
//  BawaYa_DesignRevised
//
//  Created by Hada Melino Muhammad on 10/06/22.
//

import UIKit

class GreenButtonTableViewCell: UITableViewCell {
    
    let greyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.backgroundColor = UIColor(named: "customGrey")
        return view
    }()
    
    let sideButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "colorPallete")
        button.layer.cornerRadius = 8
        button.tintColor = .white
        return button
    }()
    
    let greyViewSideButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = UIColor(named: "customDarkGrey")
        return button
    }()
    
    let greyViewMainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //Setting up two views (grey and green button)
        contentView.addSubview(greyView)
        contentView.addSubview(sideButton)

        greyView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        greyView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        greyView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        greyView.trailingAnchor.constraint(equalTo: sideButton.leadingAnchor, constant: -20).isActive = true
        
        sideButton.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        sideButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        sideButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        sideButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2).isActive = true
        
        //Setting up the grey view element
        greyView.addSubview(greyViewMainLabel)
        greyView.addSubview(greyViewSideButton)
        
        greyViewMainLabel.leadingAnchor.constraint(equalTo: greyView.leadingAnchor, constant: 20).isActive = true
        greyViewMainLabel.centerYAnchor.constraint(equalTo: greyView.centerYAnchor).isActive = true
        
        greyViewSideButton.leadingAnchor.constraint(equalTo: greyViewMainLabel.trailingAnchor, constant: -20).isActive = true
        greyViewSideButton.trailingAnchor.constraint(equalTo: greyView.trailingAnchor, constant: -20).isActive = true
        greyViewSideButton.centerYAnchor.constraint(equalTo: greyView.centerYAnchor).isActive = true
        
        
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
