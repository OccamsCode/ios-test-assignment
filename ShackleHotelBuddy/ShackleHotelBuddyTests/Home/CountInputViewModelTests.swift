//
//  ShackleHotelBuddyTests.swift
//  ShackleHotelBuddyTests
//
//  Created by Shackle on 07/07/2023.
//

import XCTest
@testable import ShackleHotelBuddy

final class CountInputViewModelTests: XCTestCase {

    var systemUnderTest: CountInputViewModel!
    
    override func setUpWithError() throws {
        systemUnderTest = CountInputViewModel(logo: "Logo", title: "Title", inputCount: 10)
    }

    override func tearDownWithError() throws {
        systemUnderTest = nil
    }
    
    func testDefaultMinValue_isZero() {
        let result = systemUnderTest.minValue
        XCTAssertEqual(result, 0)
    }
    
    func testDefaultMaxValue_is11() {
        let result = systemUnderTest.maxValue
        XCTAssertEqual(result, 11)
    }
    
    func testInitialLogoName_isLogo() {
        let result = systemUnderTest.logo
        XCTAssertEqual(result, "Logo")
    }
    
    func testInitialTitle_isTitle() {
        let result = systemUnderTest.title
        XCTAssertEqual(result, "Title")
    }
    
    func testInitialInputCount_is10() {
        let result = systemUnderTest.inputCount
        XCTAssertEqual(result, 10)
    }

    func testInitialMinValue_isThree() {
        systemUnderTest = CountInputViewModel(logo: "", title: "", minValue: 3, inputCount: 0)
        let result = systemUnderTest.minValue
        XCTAssertEqual(result, 3)
    }
    
    func testInitialMaxValue_isThree() {
        systemUnderTest = CountInputViewModel(logo: "", title: "", maxValue: 3, inputCount: 0)
        let result = systemUnderTest.maxValue
        XCTAssertEqual(result, 3)
    }
}
