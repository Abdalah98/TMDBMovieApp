//
//  Movie_AppUITests.swift
//  Movie AppUITests
//
//  Created by Abdalah Omar on 5/20/20.
//  Copyright © 2020 Hello Tomorrow. All rights reserved.
//

import XCTest

class Movie_AppUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testValidDataMovie(){
        
        
        let app = XCUIApplication()
        app.buttons["See All"].tap()
        
        let aGuyMeetsTheWomanOfHisDreamsAndInvitesHerToHisCompanySCorporateRetreatButRealizesHeSentTheInviteToTheWrongPersonStaticText = app.textViews.staticTexts["A guy meets the woman of his dreams and invites her to his company's corporate retreat, but realizes he sent the invite to the wrong person."]
        aGuyMeetsTheWomanOfHisDreamsAndInvitesHerToHisCompanySCorporateRetreatButRealizesHeSentTheInviteToTheWrongPersonStaticText.tap()
        aGuyMeetsTheWomanOfHisDreamsAndInvitesHerToHisCompanySCorporateRetreatButRealizesHeSentTheInviteToTheWrongPersonStaticText.tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .image).element.swipeDown()
        
        _ = XCUIApplication()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0).tap()
        app.buttons["plus"].tap()
        
        let scrollViewsQuery = app.scrollViews
        let addimageElementsQuery = scrollViewsQuery.otherElements.containing(.button, identifier:"addimage")
        addimageElementsQuery.children(matching: .other).element.children(matching: .textField).element.tap()
        
        let elementsQuery = scrollViewsQuery.otherElements
        let datePickersQuery = elementsQuery.datePickers
        datePickersQuery/*@START_MENU_TOKEN@*/.pickerWheels["20"]/*[[".pickers.pickerWheels[\"20\"]",".pickerWheels[\"20\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        datePickersQuery/*@START_MENU_TOKEN@*/.pickerWheels["May"]/*[[".pickers.pickerWheels[\"May\"]",".pickerWheels[\"May\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        datePickersQuery/*@START_MENU_TOKEN@*/.pickerWheels["2020"]/*[[".pickers.pickerWheels[\"2020\"]",".pickerWheels[\"2020\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        scrollViewsQuery.otherElements.containing(.button, identifier:"addimage").element.tap()
        
        let textView = addimageElementsQuery.children(matching: .textView).element
        textView.swipeUp()
        textView.tap()
        textView.tap()
        textView.tap()
        elementsQuery/*@START_MENU_TOKEN@*/.staticTexts["Add"]/*[[".buttons[\"Add\"].staticTexts[\"Add\"]",".staticTexts[\"Add\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
              
        
                                
    }
    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
