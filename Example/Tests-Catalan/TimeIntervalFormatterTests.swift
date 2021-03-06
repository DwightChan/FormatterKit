//
//  TTTTimeIntervalFormatterTests.swift
//  FormatterKit
//
//  Created by Victor Ilyukevich on 4/27/16.
//  Copyright © 2016. All rights reserved.
//

import XCTest
import FormatterKit

class TTTTimeIntervalFormatterTests: XCTestCase {
    var formatter: TTTTimeIntervalFormatter!

    override func setUp() {
        super.setUp()
        formatter = TTTTimeIntervalFormatter()
    }

    // MARK: Tests

    func testStandardPast() {
        XCTAssertEqual(formatter.stringForTimeInterval(-1), "fa 1 segon")
        XCTAssertEqual(formatter.stringForTimeInterval(-100), "fa 1 minut")
        XCTAssertEqual(formatter.stringForTimeInterval(-10000), "fa 2 hores")
        XCTAssertEqual(formatter.stringForTimeInterval(-100000), "fa 1 dia")
        XCTAssertEqual(formatter.stringForTimeInterval(-200000), "fa 2 dies")
        XCTAssertEqual(formatter.stringForTimeInterval(-10000000), "fa 3 mesos")
    }

    func testStandardFuture() {
        XCTAssertEqual(formatter.stringForTimeInterval(1), "d\'aquí 1 segon")
        XCTAssertEqual(formatter.stringForTimeInterval(100), "d\'aquí 1 minut")
        XCTAssertEqual(formatter.stringForTimeInterval(10000), "d\'aquí 2 hores")
        XCTAssertEqual(formatter.stringForTimeInterval(100000), "d\'aquí 1 dia")
        XCTAssertEqual(formatter.stringForTimeInterval(200000), "d\'aquí 2 dies")
        XCTAssertEqual(formatter.stringForTimeInterval(10000000), "d\'aquí 3 mesos")
    }

    func testIdiomaticPast() {
        formatter.usesIdiomaticDeicticExpressions = true

        XCTAssertEqual(formatter.stringForTimeInterval(-1), "fa 1 segon")
        XCTAssertEqual(formatter.stringForTimeInterval(-100), "fa 1 minut")
        XCTAssertEqual(formatter.stringForTimeInterval(-10000), "fa 2 hores")
        XCTAssertEqual(formatter.stringForTimeInterval(-100000), "ahir")
        XCTAssertEqual(formatter.stringForTimeInterval(-200000), "abans d\'ahir")
        XCTAssertEqual(formatter.stringForTimeInterval(-10000000), "fa 3 mesos")
    }
    
}
