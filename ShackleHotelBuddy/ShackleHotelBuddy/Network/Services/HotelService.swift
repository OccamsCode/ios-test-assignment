//
//  HotelService.swift
//  ShackleHotelBuddy
//
//  Created by Brian Munjoma on 09/08/2023.
//

import Foundation

protocol HotelsServiceable {
    func list(_ searchCriteria: SearchCriteriaViewModel) async -> Result<HotelList, RequestError>
}

struct HotelService: HTTPClient, HotelsServiceable {
    func list(_ searchCriteria: SearchCriteriaViewModel) async -> Result<HotelList, RequestError> {
        return await sendRequest(endpoint: HotelsEndpoint.list(searchCriteria), responseModel: HotelList.self)
    }
}
