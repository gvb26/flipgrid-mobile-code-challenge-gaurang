//
//  SignUpViewController.swift
//  mobile_coding_challenge
//
//  Created by Gaurang Bham on 4/21/22.
//

import UIKit

class SignUpViewController: UIViewController {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Profile Creation"
        label.textAlignment = .left
        label.font = UIFont(name: "Futura Bold", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var introLabel: UILabel = {
        let label = UILabel()
        label.text = "Use the form below to submit your portfolio.\nAs email and password are required"
        label.numberOfLines = 10
        label.font = UIFont(name: "Futura Medium", size: 15)
        label.textColor = .darkGray
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var signUpButton: CoreButton = {
        let button = CoreButton()
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura Medium", size: 20)
        button.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    func setUpViews() {
        view.addSubview(titleLabel)
        view.addSubview(introLabel)
        view.addSubview(signUpButton)
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ])
        
        NSLayoutConstraint.activate([
            introLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            introLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            introLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ])
        
        NSLayoutConstraint.activate([
            signUpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            signUpButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc func signUpButtonPressed() {
        let confirmationVC = ConfirmationViewController()
        self.present(confirmationVC, animated: true, completion: nil)
    }


}

