//
//  SimpleCalcUITests.swift
//  SimpleCalcUITests
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class SimpleCalcUITests: XCTestCase {
    
    var app: XCUIApplication?

    override func setUp() {
        app = XCUIApplication()
        app?.launch()
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    
    override func tearDown() {
    }

    
    func testGivenIs1Plus4Then5Displayed() {
              //on clique sur les buttons
               app?.buttons["1"].tap()
               app?.buttons[" + "].tap()
               app?.buttons["4"].tap()
               app?.buttons[" = "].tap()
               
                //on récupère le label sur lequel s'affiche notre chaîne sur la calculette et vérifie si c'est bien la bonne chaîne qui est affichée.
               let currentTextView = app?.textViews["textView"]
               XCTAssertEqual(currentTextView?.value as! String, "1 + 4 = 5")
         }

}
