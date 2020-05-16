//
//  HomeViewControllerUITests.swift
//  GihubRepositoriesDafleCardosoUITests
//
//  Created by Dafle Cardoso on 16/05/20.
//  Copyright © 2020 Dafle Cardoso. All rights reserved.
//

import XCTest

class HomeViewControllerUITests: XCTestCase {
    
    private let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launchArguments = ["UITest"]
        app.launch()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_swipe_items_table_view() {
        let isDisplayingMain = app.otherElements["Main View"].exists
        
        XCTAssertTrue(isDisplayingMain)
        
        XCTAssertTrue(app.staticTexts["Swift issues"].exists)
        
        app.swipeDown()
        
        app.tables.cells.staticTexts["MOCK_FIRST_TITLE"].tap()
        
        app.navigationBars.buttons.element(boundBy: 0).tap()
        
        app.tables.cells.staticTexts["MOCK_SECOND_TITLE"].tap()
        
        app.navigationBars.buttons.element(boundBy: 0).tap()
        
        app.tables.cells.staticTexts["MOCK_THIRD_TITLE"].tap()
        
        app.buttons.staticTexts["Ver na web ->"].tap()
        
        sleep(3)
    }
}
