//
//  CalculatableTests.swift
//  CalculatorTests
//
//  Created by Jun Bang on 2021/11/25.
//

import XCTest
@testable import Calculator

class CalculatableTests: XCTestCase {
    var sut: Calculatable!
    
    override func setUpWithError() throws {
        sut = Calculator()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testCalculatable_givenMultiplicationEquation_expect200() {
        let FormulaList = ["10", "๐", "20"]
        
        sut.updateFormulaList(formulaList: FormulaList)
        let result = sut.calculateResult()
        
        XCTAssertEqual(result, 200)
    }
    
    func testCalculatable_givenInvalidEquation_expectNaN() {
        let FormulaList = ["10", "รท", "0"]
        
        sut.updateFormulaList(formulaList: FormulaList)
        let result = sut.calculateResult()
        
        XCTAssertTrue(result.isNaN)
    }
    
    func testCalculatable_givenMixedEquation_expect4Point2() {
        let formulaList = ["10", "๐", "20", "โ", "30", "+", "40", "รท", "50"]
        
        sut.updateFormulaList(formulaList: formulaList)
        let result = sut.calculateResult()
        
        XCTAssertEqual(result, 4.2)
    }
    
    func testCalculatable_givenMixedEquation_expect1Point4() {
        let formulaList = ["1.5", "โ", "0.5", "๐", "10", "+", "4", "รท", "10"]
        
        sut.updateFormulaList(formulaList: formulaList)
        let result = sut.calculateResult()
        
        XCTAssertEqual(result, 1.4)
    }
}

extension Calculatable {
    mutating func updateFormulaList(formulaList: [String]) {
        formulaStack.append(contentsOf: formulaList)
    }
}
