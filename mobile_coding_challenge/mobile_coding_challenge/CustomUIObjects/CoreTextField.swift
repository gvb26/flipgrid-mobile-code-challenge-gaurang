//
//  CoreTextField.swift
//  mobile_coding_challenge
//
//  Created by Gaurang Bham on 4/24/22.
//

import Foundation
import UIKit

class CoreTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpTextField()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setUpTextField() {
        layer.cornerRadius = 15
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 0.5
        font = UIFont(name: "Futura Medium", size: 15)
        textColor = .darkGray
        autocorrectionType = .no
        autocapitalizationType = .none
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 20, y: bounds.origin.y, width: bounds.width, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 20, y: bounds.origin.y, width: bounds.width, height: bounds.height)
    }
}
