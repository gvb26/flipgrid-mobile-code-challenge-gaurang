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
        label.numberOfLines = 10
        label.font = UIFont(name: "Futura Medium", size: 15)
        label.textColor = .darkGray
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nameTextField: CoreTextField = {
        let textField = CoreTextField()
        textField.placeholder = "First Name"
        textField.autocorrectionType = .no
        return textField
    }()
    
    lazy var signUpButton: CoreButton = {
        let button = CoreButton()
        button.setTitle("Submit", for: .normal)
        button.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
        return button
    }()
    
    var signUpHandler = DataHandler()
    
    var signUpForm: SignUpModel? {
        didSet {
            DispatchQueue.main.async { [self] in
                print(signUpForm)
                introLabel.text = signUpForm?.message
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getFormData()
        setUpViews()
    }
    
    func getFormData() {
        signUpHandler.fetchSignUpFormData { (form) in
            DispatchQueue.main.async { [self] in
                self.signUpForm = form
            }
        }
    }
    
    func setUpViews() {
        view.addSubview(titleLabel)
        view.addSubview(introLabel)
        view.addSubview(signUpButton)
        view.addSubview(nameTextField)
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
            nameTextField.topAnchor.constraint(equalTo: introLabel.bottomAnchor, constant: 20),
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            nameTextField.heightAnchor.constraint(equalToConstant: 50)
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
        confirmationVC.confirmationsFields = [nameTextField.text ?? ""]
        self.present(confirmationVC, animated: true, completion: nil)
    }
}

