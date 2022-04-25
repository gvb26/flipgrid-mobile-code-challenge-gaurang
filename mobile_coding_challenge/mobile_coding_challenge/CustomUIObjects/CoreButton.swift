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
    
    private func setUpButton() {
        setTitleColor(.white, for: .normal)
        backgroundColor = .red
        setStyle()
    }
    
    private func setStyle() {
        layer.cornerRadius = 15
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont(name: "Futura Medium", size: 20)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
