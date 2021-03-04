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
    
    
    
}
