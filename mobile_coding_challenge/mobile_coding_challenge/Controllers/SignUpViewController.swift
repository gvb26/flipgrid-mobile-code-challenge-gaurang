//
//  SignUpViewController.swift
//  mobile_coding_challenge
//
//  Created by Gaurang Bham on 4/21/22.
//

import UIKit

class SignUpViewController: UIViewController {
    
    var signUpHandler: DataHandler = DataHandler()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Profile Creation"
        label.textAlignment = .left
        label.textColor = .darkGray
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
    
    lazy var signUpFieldsTable: UITableView = {
        let tableView = UITableView()
        tableView.separatorColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var signUpForm: SignUpModel? {
        didSet {
            DispatchQueue.main.async { [self] in
                introLabel.text = signUpForm?.message
                signUpFieldsTable.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getFormData()
        signUpFieldsTable.delegate = self
        signUpFieldsTable.dataSource = self
        setUpViews()
    }
    
    // Fetches form data from JSON (Can be configured to be an API Call)
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
        view.addSubview(signUpFieldsTable)
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
            signUpFieldsTable.topAnchor.constraint(equalTo: introLabel.bottomAnchor, constant: 20),
            signUpFieldsTable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpFieldsTable.widthAnchor.constraint(equalTo: view.widthAnchor),
            signUpFieldsTable.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: -20)
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
        confirmationVC.confirmationsFields = gatherSignUpInformation()
        self.present(confirmationVC, animated: true, completion: nil)
    }
    
    // Aggregates the sign up information to be submitted
    func gatherSignUpInformation() -> [String] {
        guard let count = signUpForm?.signUpFields.count else { return [] }
        var fieldInformation = [String]()
        for i in 0..<count - 1 {
            let cell = signUpFieldsTable.cellForRow(at: IndexPath(row: i, section: 0)) as! SignUpFieldCell
            if isValidEntry(cell.signUpField.placeholder, cell.signUpField.text) {
                fieldInformation.append(cell.signUpField.text ?? "")
            } else {
                displayInvalidAlert(cell.signUpField.placeholder)
                break
            }
        }
        let passCell = signUpFieldsTable.cellForRow(at: IndexPath(row: count - 1, section: 0)) as! SignUpFieldCell
        if !isValidEntry(passCell.signUpField.placeholder, passCell.signUpField.text ?? "") {
            displayInvalidAlert(passCell.signUpField.placeholder)
        }
        return fieldInformation
    }
    
    func isValidEntry(_ fieldType: String?, _ input: String?) -> Bool {
        switch fieldType {
            case "Password":
                return isValidPassword(input)
            case "Email Address":
                return isValidEmail(input)
            default:
                return true
        }
    }
    
    func isValidEmail(_ value: String?) -> Bool {
        guard value != nil else { return false }
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$")
        return passwordTest.evaluate(with: value)
    }
    
    func isValidPassword(_ value: String?) -> Bool {
        guard value != nil else { return false }
        
        // at least one uppercase, lower case, digit and at least 8 characters
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z])(?=.*[$@$#!%*?&_~']).{8,}")
        return passwordTest.evaluate(with: value)
    }
    
    func displayInvalidAlert(_ fieldType: String?) {
        var title = ""
        var message = ""
        switch fieldType {
        case "Password":
            title = "Invalid Password"
            message = "Password must be at least 8 characters and contain a lowercase letter, uppercase letter, number and special character"
            break
        case "Email Address":
            title = "Invalid Email"
            message = "Email must be in the correct format"
        default:
            title = "Invalid field"
            message = "Make sure you are entering valid data"
        }
        let invalidAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        invalidAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(invalidAlert, animated: true, completion: nil)
    }
}

extension SignUpViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return signUpForm?.signUpFields.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SignUpFieldCell()
        cell.signUpField.placeholder = signUpForm?.signUpFields[indexPath.row] ?? ""
        cell.contentView.isUserInteractionEnabled = false
        if cell.signUpField.placeholder == "Password" {
            cell.signUpField.isSecureTextEntry = true
        }
        return cell
    }
    
    
}

