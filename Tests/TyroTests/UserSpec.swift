//
//  UserSpec.swift
//  Tyro
//
//  Created by Matthew Purland on 11/19/15.
//  Copyright © 2015 TypeLift. All rights reserved.
//

import XCTest
import Swiftx

@testable import Tyro

class UserSpec : XCTestCase {
    let userJson = "{\"id\": 103622342330925644, \"name\": \"Matthew Purland\", \"age\": 30, \"tweets\": [\"Hello from Tyro\"], \"attributes\": {\"profile\": \"Test Profile\"}, \"balance\": 102.30, \"admin\": true, \"latitude\": 31.75, \"longitude\": 31.75}"
    let userJsonWithNickname = "{\"id\": 103622342330925644, \"name\": \"Matthew Purland\", \"age\": 30, \"tweets\": [\"Hello from Tyro\"], \"attributes\": {\"profile\": \"Test Profile\"}, \"balance\": 102.30, \"admin\": true, \"latitude\": 31.75, \"longitude\": 31.75, \"optionalNickname\":\"mpurland\"}"
    let userJsonWithoutLongitude = "{\"id\": 103622342330925644, \"name\": \"Matthew\", \"age\": 30, \"tweets\": [\"Hello from Tyro\"], \"attributes\": {\"profile\": \"Test Profile\"}, \"balance\": 102.30, \"admin\": true, \"latitude\": 31.75}"
    
    func testDecodeUserEither() {
        let userEither: Either<JSONError, User>? = userJson.toJSON?.valueEither()
        XCTAssertNotNil(userEither)
    }
    
    func testDecodeUser() {
        let user: User? = userJson.toJSON?.value()
        XCTAssertNotNil(user)
        
        XCTAssert(user?.id == 103622342330925644)
        XCTAssert(user?.name == "Matthew Purland")
        XCTAssert(user?.age == 30)
        XCTAssert(user?.tweets == ["Hello from Tyro"])
        XCTAssert(user?.profile == "Test Profile")
        XCTAssert(user?.balance == 102.30)
        XCTAssert(user?.admin == true)
        XCTAssert(user?.latitude == 31.75)
        XCTAssert(user?.longitude == 31.75)
        XCTAssert(user?.optionalNickname == nil)
        
        let userWithNickname: User? = userJsonWithNickname.toJSON?.value()
        XCTAssertNotNil(userWithNickname)
        XCTAssert(userWithNickname?.optionalNickname == "mpurland")
        
        let nickname1: String?? = userJson.toJSON <?? "optionalNickname"
        XCTAssert(nickname1! == nil)
        
        let nickname2: String?? = userJsonWithNickname.toJSON <?? "optionalNickname"
        XCTAssert(nickname2! == "mpurland")
    }
    
    func testDecodeUsers() {
        let usersJson = "[\(userJson),\(userJson),\(userJson)]"
        let users: [User]? = usersJson.toJSON?.value()
        XCTAssertNotNil(users)
        XCTAssert(users?.count == 3)
    }
    
    func testDecodeUserInvalid() {
        // Longitude is missing, User.fromJSON will return a JSONError
        let user: User? = userJsonWithoutLongitude.toJSON?.value()
        XCTAssertNil(user)
    }
}
