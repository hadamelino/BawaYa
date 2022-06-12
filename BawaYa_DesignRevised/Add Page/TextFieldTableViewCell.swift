//
//  TextFieldTableViewCell.swift
//  BawaYa_DesignRevised
//
//  Created by Hada Melino Muhammad on 10/06/22.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {
    

    let textField: UITextField = {
        let theTextField = UITextField()
        theTextField.translatesAutoresizingMaskIntoConstraints = false
        theTextField.backgroundColor = UIColor(named: "customGrey")
        theTextField.layer.cornerRadius = 8
        return theTextField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(textField)
        
        textField.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }


}
