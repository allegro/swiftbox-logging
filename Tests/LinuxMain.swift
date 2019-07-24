#if os(Linux)

import XCTest
@testable import SwiftBoxLoggingTests

XCTMain([
    testCase(Logger2Tests.allTests),
    testCase(LoggingManagerTests.allTests),
])

#endif
