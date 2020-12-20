import XCTest
@testable import Tyro

final class TyroTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Tyro().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
