import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(FelikromakaiTests.allTests),
    ]
}
#endif
