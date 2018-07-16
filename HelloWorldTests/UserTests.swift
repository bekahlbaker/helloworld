//
//  UserTests.swift
//  HelloWorldTests
//
//  Created by Rebekah Baker on 7/13/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import XCTest
@testable import HelloWorld

class UserTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAPIRequest() {
        APIRequest.makeRequestTo(endpoint: UserEndpoints.getUsers(countOf: 2)) { (data, error) in
            XCTAssertNotNil(data)
            XCTAssertNil(error)
            
            guard let results = try? JSONDecoder().decode(UserResult.self, from: data!) else {
                XCTFail()
                return
            }
            
            XCTAssertNotNil(results)
            XCTAssertEqual(results.users.count, 2)
        }
    }
    
    func testConvertJSONToUser() {
        let data = FakeJSON.json
        guard let result = try? JSONDecoder().decode(UserResult.self, from: data) else {
            XCTFail()
            return
        }
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result.users.count, 1)
        XCTAssertEqual(result.users.first?.name.first, "rolf")
        XCTAssertEqual(result.users.first?.picture.medium, "https://randomuser.me/api/portraits/med/men/65.jpg")
    }

    func testUserViewModel() {
        let user = User(name: Name(first: "Bob", last: "Vance"), picture: Picture(thumbnail: "", medium: "", large: ""))
        let secondUser = User(name: Name(first: "Michael", last: "Scott"), picture: Picture(thumbnail: "", medium: "", large: ""))
        let userViewModel = UserViewModel(user: user)
        XCTAssertEqual(userViewModel.name, user.fullName())
        XCTAssertEqual(userViewModel.imageURL, URL(string: user.picture.medium))
        let testHasChat = user.hasChatWith(user: secondUser)
        if testHasChat {
            XCTAssertEqual(userViewModel.chatIconName, "messageIcon")
        } else {
            XCTAssertEqual(userViewModel.chatIconName, "arrowIcon")
        }
    }
    
    func testEncodeUser() {
       let user = User(name: Name(first: "Bob", last: "Vance"), picture: Picture(thumbnail: "", medium: "", large: ""))
       let encodedUser = user.encode()
        XCTAssertNotNil(encodedUser)
    }
    
}
