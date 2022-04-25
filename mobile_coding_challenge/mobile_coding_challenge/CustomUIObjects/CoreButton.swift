//
//  CoreButton.swift
//  mobile_coding_challenge
//
//  Created by Gaurang Bham on 4/21/22.
//

import Foundation
import UIKit

class CoreButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpButton()
    }
    
    func setUpButton() {
        setTitleColor(.white, for: .normal)
        backgroundColor = .red
        setShadow()
    }
    
    private func setShadow() {
        layer.cornerRadius = 20
        clipsToBounds = true
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.2
    }
    
}
