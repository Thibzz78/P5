//
//  SimpleCalcTests.swift
//  SimpleCalcTests
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class SimpleCalcTests: XCTestCase {
    
    let model = OperationModel()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testResultExample() {
        model.calculText.append("1")
        model.calculText.append(" + ")
        model.calculText.append("1")
        model.getResult()
        XCTAssert(model.calculText == "1 + 1 = 2.0")
    }
    
    func testIsnotExample() {
        model.calculText.append("1")
        model.calculText.append(" + ")
        model.calculText.append("1")
        model.calculText.append(" + ")
            
        XCTAssertFalse(model.expressionIsCorrect)
    }
    
    func testExample() {
        model.calculText.append("1")
        model.calculText.append(" + ")
        model.calculText.append("1")
            
        XCTAssertTrue(model.expressionIsCorrect)
    }
    
    func testExpressionHaveEnoughElement() {
        model.calculText.append("1")
        model.calculText.append(" + ")
        model.calculText.append("1")
        
        XCTAssertTrue(model.expressionHaveEnoughElement)
    }
    
    func testExpressionFalseHaveEnoughElement() {
        model.calculText.append("1")
        model.calculText.append(" + ")
        
        XCTAssertFalse(model.expressionHaveEnoughElement)
    }
    
    
    func testCanAddOperator(){
        model.calculText.append("1")
        XCTAssertTrue(model.canAddOperator)
    }
    
    func testCanNotAddOperator(){
        model.calculText.append("1")
        model.calculText.append(" + ")
        XCTAssertFalse(model.canAddOperator)
    }
    
    
    func testExpressionHaveResult() {
        model.calculText.append("1")
        model.calculText.append(" + ")
        model.calculText.append("1")
        model.calculText.append("=")
        
        XCTAssertTrue(model.expressionHaveResult)
    }
    
    func testExpressionNotHaveResult() {
        model.calculText.append("1")
        model.calculText.append(" + ")
        model.calculText.append("1")
        
        XCTAssertFalse(model.expressionHaveResult)
    }
    
    func testPriorityCalcul() {
        model.calculText.append("1")
        model.calculText.append(" + ")
        model.calculText.append("2")
        model.calculText.append(" * ")
        model.calculText.append("5")
        model.calculText.append(" - ")
        model.calculText.append("1")
        model.calculText.append(" / ")
        model.calculText.append("4")
        model.getResult()
        
        XCTAssert(model.calculText == "1 + 2 * 5 - 1 / 4 = 10.75")
    }
    
    func testNotDivisionZero() {
        model.calculText.append("1")
        model.calculText.append(" / ")
        model.calculText.append("0")
        
        XCTAssertTrue(model.expressionNotDivisionZero)
    }
    
    
}
