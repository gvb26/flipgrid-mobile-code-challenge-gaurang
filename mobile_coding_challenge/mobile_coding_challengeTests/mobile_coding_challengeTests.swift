//
//  mobile_coding_challengeTests.swift
//  mobile_coding_challengeTests
//
//  Created by Gaurang Bham on 4/21/22.
//

import XCTest
@testable import mobile_coding_challenge

class mobile_coding_challengeTests: XCTestCase {

    var signUpVC = SignUpViewController()

    func testInvalidEmail() {
        let email = "gaurangbhamgmail"
        XCTAssertFalse(signUpVC.isValidEmail(email))
    }
    
    func testValidEmail() {
        let email = "gaurangbham@gmail.com"
        XCTAssertTrue(signUpVC.isValidEmail(email))
    }
    
    func testInvalidPassword() {
        let pass = "testpass"
        XCTAssertFalse(signUpVC.isValidPassword(pass))
    }
    
    func testValidPassword() {
        let pass = "Test101!"
        XCTAssertTrue(signUpVC.isValidPassword(pass))
    }
    
    func testInvalidEntryEmail() {
        let email = "gaurangbhamgmail"
        XCTAssertFalse(signUpVC.isValidEntry("Email Address", email))
    }
    
    func testInvalidEntryPassword() {
        let pass = "testpass"
        XCTAssertFalse(signUpVC.isValidEntry("Password", pass))
    }
    
    func testIsValidEntry() {
        let text = "test.com"
        XCTAssertTrue(signUpVC.isValidEntry("website", text))
    }

}
