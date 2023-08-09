//
//  Endpoint.swift
//  ShackleHotelBuddy
//
//  Created by Brian Munjoma on 09/08/2023.
//

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: Encodable? { get }
}

extension Endpoint {
    var scheme: String {
        return "https"
    }

    var host: String {
        return "hotels4.p.rapidapi.com"
    }
}

