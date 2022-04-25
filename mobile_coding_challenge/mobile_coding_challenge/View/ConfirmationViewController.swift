//
//  ConfirmationViewController.swift
//  mobile_coding_challenge
//
//  Created by Gaurang Bham on 4/21/22.
//

import Foundation
import UIKit

class ConfirmationViewController: UIViewController {
    
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello Audrey!"
        label.textAlignment = .left
        label.font = UIFont(name: "Futura Bold", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var introLabel: UILabel = {
        let label = UILabel()
        label.text = "Your super-awesome portfolio has been successfully submitted! The details belowe will be public within your community!"
        label.numberOfLines = 10
        label.font = UIFont(name: "Futura Medium", size: 15)
        label.textColor = .darkGray
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var signInButton: CoreButton = {
        let button = CoreButton()
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura Medium", size: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpViews()
    }
    
    func setUpViews() {
        view.addSubview(welcomeLabel)
        view.addSubview(introLabel)
        view.addSubview(signInButton)
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ])
        
        NSLayoutConstraint.activate([
            introLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            introLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            introLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ])
        
        NSLayoutConstraint.activate([
            signInButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            signInButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
