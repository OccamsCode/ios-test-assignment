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
        let rapidAPIKey = Bundle.main.infoDictionary?["SECRET_KEY"] as? String ?? "N/A"
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
                return HotelListBody(searchCriteria)
            case .detail:
                return nil
            }
        }
}
