//
//  TableUITests.swift
//  TableUITests
//
//  Created by Артем Парфенов on 17.04.2023.
//

import XCTest

final class TableUITests: XCTestCase {



    func testBuy() {
        let app = XCUIApplication()
        app.launch()
        let tablesQuery = app.tables
        let sectionLabelMacs = tablesQuery/*@START_MENU_TOKEN@*/.otherElements["Macs"].staticTexts["Macs"]/*[[".otherElements[\"Macs\"].staticTexts[\"Macs\"]",".staticTexts[\"Macs\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
        let sectionLabelIphones = tablesQuery/*@START_MENU_TOKEN@*/.otherElements["Iphones"].staticTexts["Iphones"]/*[[".otherElements[\"Iphones\"].staticTexts[\"Iphones\"]",".staticTexts[\"Iphones\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
        let sectionLabelPods = tablesQuery.otherElements["Pods"].staticTexts["Pods"]

        XCTAssertTrue(sectionLabelMacs.exists)
        XCTAssertTrue(sectionLabelIphones.exists)
        XCUIApplication().tables.cells.containing(.staticText, identifier:"Iphone 14").element.swipeUp()
        XCTAssertTrue(sectionLabelPods.exists)

        tablesQuery.otherElements["Macbook Pro 16"].staticTexts["Macbook Pro 16"].tap()

        // Заголовок в scrollView
        let macbookPro16StaticText = XCUIApplication().navigationBars["Macbook Pro 16"].staticTexts["Macbook Pro 16"]

        let scrollViewElements = XCUIApplication().scrollViews.otherElements
        let label = scrollViewElements.staticTexts["Macbook Pro 16"]
        let description = scrollViewElements.staticTexts["For designers"]
        let buttonText = scrollViewElements.staticTexts["BUY"]

        scrollViewElements.containing(.staticText, identifier:"Macbook Pro 16").element.tap()
        // проверка наличия элементов
        XCTAssertTrue(macbookPro16StaticText.exists)
        XCTAssertTrue(label.exists)
        XCTAssertTrue(description.exists)
        XCTAssertTrue(buttonText.exists)

        scrollViewElements/*@START_MENU_TOKEN@*/.buttons["BUY"].staticTexts["BUY"]/*[[".buttons[\"BUY\"].staticTexts[\"BUY\"]",".staticTexts[\"BUY\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
    }


}

//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//
//        // In UI tests it is usually best to stop immediately when a failure occurs.
//        continueAfterFailure = false
//
//        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
//    }

//    }

