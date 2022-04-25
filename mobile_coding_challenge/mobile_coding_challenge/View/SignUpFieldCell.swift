//
//  SignUpFieldCell.swift
//  mobile_coding_challenge
//
//  Created by Gaurang Bham on 4/25/22.
//

import Foundation
import UIKit

class SignUpFieldCell: UITableViewCell {
    
    lazy var signUpField: CoreTextField = {
        let textField = CoreTextField()
        textField.isUserInteractionEnabled = true
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpCell() {
        addSubview(signUpField)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            signUpField.centerXAnchor.constraint(equalTo: centerXAnchor),
            signUpField.centerYAnchor.constraint(equalTo: centerYAnchor),
            signUpField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            signUpField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
}
