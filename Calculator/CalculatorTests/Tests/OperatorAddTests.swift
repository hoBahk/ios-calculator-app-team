//
//  OperatorAddTests.swift
//  CalculatorTests
//
//  Created by Jun Bang on 2021/11/12.
//

import XCTest
@testable import Calculator

class OperatorAddTests: XCTestCase {
    var sut: Operator!
    
    override func setUpWithError() throws {
        sut = Operator.add
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testCalculate_givenDecimal10andDecimal10_expectDecimal20() {
        XCTAssertEqual(sut.calculate(lhs: 10.0, rhs: 10.0), 20.0)
    }
    
    func testCalculate_givenDecimal10andDecimal10_expectNoDecimal20() {
        XCTAssertEqual(sut.calculate(lhs: 10.0, rhs: 10.0), 20)
    }
    
    func testCalculate_givenNoDecimal10andNoDecimal10_expectNoDecimal20() {
        XCTAssertEqual(sut.calculate(lhs: 10, rhs: 10), 20)
    }
}
