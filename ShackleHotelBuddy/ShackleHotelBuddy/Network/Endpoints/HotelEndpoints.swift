//
//  HotelEndpoints.swift
//  ShackleHotelBuddy
//
//  Created by Brian Munjoma on 09/08/2023.
//

import Foundation

enum HotelsEndpoint {
    case list(_ searchCriteria: SearchCriteriaViewModel)
    case detail
}

extension HotelsEndpoint: Endpoint {
    
    var path: String {
        switch self {
        case .list:
            return "/properties/v2/list"
        case .detail:
            return "properties/v2/detail"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .list, .detail:
            return .post
        }
    }
    
    var header: [String : String]? {
        let rapidAPIKey = "85d8bfaa56msha336d212fa62319p1535acjsnb18863e8bf0d"
        switch self {
        case .list, .detail:
            return [
                "content-type": "application/json",
                "X-RapidAPI-Key": rapidAPIKey,
                "X-RapidAPI-Host": "hotels4.p.rapidapi.com"
            ]
        }
    }
    
    var body: Encodable? {
            switch self {
            case .list(let searchCriteria):
                return nil //HotelListBody(searchCriteria)
            case .detail:
                return nil
            }
        }
}
