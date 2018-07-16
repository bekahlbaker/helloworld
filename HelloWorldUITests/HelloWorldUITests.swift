//
//  HelloWorldUITests.swift
//  HelloWorldUITests
//
//  Created by Rebekah Baker on 5/10/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import XCTest

class HelloWorldUITests: XCTestCase {
    
    var app: XCUIApplication!
        
    override func setUp() {
        super.setUp()
        
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBeginChatting() {
        let app = XCUIApplication()
        let beginChattingButton = app.buttons["begin chatting"]
        let goButton = app.buttons["go!"]
        let usernameTextField = app.textFields["Username"]
        let passwordTextField = app.textFields["Password"]
        
        if beginChattingButton.isSelected {
            XCTAssertTrue(goButton.exists)
            XCTAssertFalse(goButton.exists)
            
            usernameTextField.tap()
            usernameTextField.typeText("username")
            XCTAssertEqual(usernameTextField.value as! String, "username")
            
            passwordTextField.tap()
            passwordTextField.typeText("password")
            XCTAssertEqual(passwordTextField.value as! String, "password")
            
            if goButton.isSelected {
                // test that view navigates to next controller
            }
        }
    }
    
}
