//
//  DataHandler.swift
//  mobile_coding_challenge
//
//  Created by Gaurang Bham on 4/24/22.
//

import Foundation

public class DataHandler {
    
    func fetchSignUpFormData(completionHandler: @escaping (SignUpModel) -> Void) {
        
        guard let file = Bundle.main.url(forResource: "SignUpForm", withExtension: "json") else { return }
        
        do {
            let data = try Data(contentsOf: file)
            let signUpFormData = try JSONDecoder().decode(SignUpModel.self, from: data)
            completionHandler(signUpFormData)
        } catch {
            let error = error
            print(error.localizedDescription)
        }
        
    }
    
    func fetchConfirmationData(completionHandler: @escaping (SignUpModel) -> Void) {
        
        guard let file = Bundle.main.url(forResource: "Confirmation", withExtension: "json") else { return }
        
        do {
            let data = try Data(contentsOf: file)
            let signUpFormData = try JSONDecoder().decode(SignUpModel.self, from: data)
            completionHandler(signUpFormData)
        } catch {
            let error = error
            print(error.localizedDescription)
        }
        
    }
    
    
}
