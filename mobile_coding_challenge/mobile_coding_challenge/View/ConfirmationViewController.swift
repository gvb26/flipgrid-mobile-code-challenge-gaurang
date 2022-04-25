//
//  ConfirmationViewController.swift
//  mobile_coding_challenge
//
//  Created by Gaurang Bham on 4/21/22.
//

import Foundation
import UIKit

class ConfirmationViewController: UIViewController {
    
    var confirmationsFields = [String]()
    
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
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
        return button
    }()
    
    lazy var userInfoTable: UITableView = {
        let tableView = UITableView()
        tableView.separatorColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = false
        tableView.isUserInteractionEnabled = false
        return tableView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpViews()
        userInfoTable.delegate = self
        userInfoTable.dataSource = self
        welcomeLabel.text = "Hello \(confirmationsFields[0])!"
    }
    
    func setUpViews() {
        view.addSubview(welcomeLabel)
        view.addSubview(introLabel)
        view.addSubview(userInfoTable)
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
            userInfoTable.topAnchor.constraint(equalTo: introLabel.bottomAnchor, constant: 20),
            userInfoTable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userInfoTable.widthAnchor.constraint(equalTo: view.widthAnchor),
            userInfoTable.heightAnchor.constraint(equalToConstant: CGFloat(confirmationsFields.count * 50))
        ])
        
        NSLayoutConstraint.activate([
            signInButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            signInButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

extension ConfirmationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        confirmationsFields.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = confirmationsFields[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Futura Medium", size: 15)
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = .darkGray
        return cell
    }
    
    
}
