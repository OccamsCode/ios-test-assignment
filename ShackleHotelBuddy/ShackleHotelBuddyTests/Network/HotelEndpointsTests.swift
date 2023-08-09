//
//  HotelEndpointsTests.swift
//  ShackleHotelBuddyTests
//
//  Created by Brian Munjoma on 09/08/2023.
//

import XCTest
@testable import ShackleHotelBuddy

final class HotelEndpointsTests: XCTestCase {
    
    var systemUnderTest: Endpoint!
    
    override func setUpWithError() throws {
        systemUnderTest = HotelsEndpoint.list(SearchCriteriaViewModel())
    }
    
    override func tearDownWithError() throws {
        systemUnderTest = nil
    }
    
    func testHotelListScheme() {
        let result = systemUnderTest.scheme
        XCTAssertEqual(result, "https")
    }
    
    func testHotelListHost() {
        let result = systemUnderTest.host
        XCTAssertEqual(result, "hotels4.p.rapidapi.com")
    }
    
    func testHotelListPath() {
        let result = systemUnderTest.path
        XCTAssertEqual(result, "/properties/v2/list")
    }
    
    func testHotelListMethod() {
        let result = systemUnderTest.method
        XCTAssertEqual(result, RequestMethod.post)
    }
    
    func testHotelListHeaders() {
        let result = systemUnderTest.header
        XCTAssertEqual(result?.count, 3)
    }
    
    func testHotelListBody() {
        let result = systemUnderTest.body
        XCTAssertNotNil(result)
    }
}
