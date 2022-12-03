//
//  UnitTestUITest.swift
//  MiniExchangeTests
//
//  Created by MAA on 3.12.2022.
//

import XCTest

class when_change_new_coin_screen_is_presented :XCTestCase {
 
    var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        app.launch()
        
        
        let exchangeTaskButton = app.buttons["exchangeTaskButton"]
        exchangeTaskButton.tap()
    }
    
    func test_should_make_sure_all_required_controls_are_present() {
        XCTAssertTrue(app.textFields["amountTextField"].exists)
        XCTAssertTrue(app.buttons["exchangeTaskButton"].exists)
    }
    
    func test_should_dismiss_modal_after_change_task() {
        
        let amountTextField = app.textFields["amountTextField"]
        amountTextField.tap()
        amountTextField.typeText("120")
        
        let exchangeTaskButton = app.buttons["exchangeTaskButton"]
        exchangeTaskButton.tap()
        
        XCTAssertFalse(exchangeTaskButton.waitForExistence(timeout: 0.5))
    }
    
    // Bu testi deneyebilmek için CustomAlertView sayfasının NavigationView aktik olan görünümü etkinleştirmeniz gerekir.
    func test_should_make_sure_screen_is_displayed() {
        
        let addTaskNavBarTitle = app.staticTexts["Warning View"]
        XCTAssert(addTaskNavBarTitle.waitForExistence(timeout: 5.0))
        // Sürenin 5sn olmasının nedeni, her iki para birimininde seçildikten sonra butona aktif olduğu için zaman kazanabilmek için.
    }
    
    
}
