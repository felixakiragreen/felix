import XCTest
@testable import FelixCP

final class FelixCPTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(FelixCP().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
