//
//  CoreButton.swift
//  mobile_coding_challenge
//
//  Created by Gaurang Bham on 4/21/22.
//

import Foundation
import UIKit

class CoreButton: UIButton {
    let gradientLayer = CAGradientLayer()
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
        setStyle() 
    }
    
    private func setStyle() {
        backgroundColor = .red
        layer.cornerRadius = 15
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont(name: "Futura Medium", size: 20)

        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.orange.cgColor, UIColor.red.cgColor]
        gradientLayer.locations = [0.0,1.0]
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = CGRect(x: 0, y: 0, width: 200, height: 60)
        gradientLayer.cornerRadius = 15
        layer.insertSublayer(gradientLayer, at: 0)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
