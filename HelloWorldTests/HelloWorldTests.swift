//
//  HelloWorldTests.swift
//  HelloWorldTests
//
//  Created by Rebekah Baker on 5/10/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import XCTest

@testable import HelloWorld

class HelloWorldTests: XCTestCase {
    
    override func setUp() {
        super.setUp()

    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        let user: User!
        user = User(username: "Test")
        XCTAssertEqual(user.username, "Test")
    }
    
}
