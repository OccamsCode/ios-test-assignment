//
//  HotelListModels.swift
//  ShackleHotelBuddy
//
//  Created by Brian Munjoma on 09/08/2023.
//

import Foundation

struct HotelListBody: Encodable {
    
    struct Destination: Encodable {
        
        struct Coordinates: Encodable {
            let lat: Double
            let long: Double
        }
        
        var regionId: String
        var coordinates: Coordinates
        
        static var london: Destination {
            return Destination(regionId: "2114",
                               coordinates: Coordinates(lat: 51.50746, long: -0.127673))
        }
    }
    
    struct RequestDate: Encodable {
        let day: Int
        let month: Int
        let year: Int
    }
    
    struct Room: Encodable {
        
        struct Children: Encodable {
            let age: Int
        }
        
        let adults: Int
        let children: [Children]
    }
    
    struct Filter: Encodable {
        
        struct Range: Codable {
            var min: Int
            var max: Int
        }
        
        let price: Range
        
        static var standard: Filter {
            return Filter(price: Range(min: 1, max: 500))
        }
    }
    
    var currency: String = "GBP"
    var eapid: Int = 5
    var locale: String = "en_GB"
    var siteId: Int = 300000005
    var destination: Destination
    var checkInDate: RequestDate
    var checkOutDate: RequestDate
    var rooms: [Room]
    var resultsStartingIndex: Int = 0
    var resultsSize: Int = 20
    var sort: String = "PRICE_LOW_TO_HIGH"
    var filters: Filter?
    
    init(currency: String, eapid: Int, locale: String, siteId: Int, destination: Destination, checkInDate: RequestDate, checkOutDate: RequestDate, rooms: [Room], resultsStartingIndex: Int, resultsSize: Int, sort: String, filters: Filter? = nil) {
        self.currency = currency
        self.eapid = eapid
        self.locale = locale
        self.siteId = siteId
        self.destination = destination
        self.checkInDate = checkInDate
        self.checkOutDate = checkOutDate
        self.rooms = rooms
        self.resultsStartingIndex = resultsStartingIndex
        self.resultsSize = resultsSize
        self.sort = sort
        self.filters = filters
    }
    
    init(_ searchCriteria: SearchCriteriaViewModel,
         destination: Destination = .london,
         filter: HotelListBody.Filter? = .standard) {
        self.filters = filter
        self.destination = destination
        
        let calendar = Calendar.current
        var dateComponents = calendar.dateComponents([.day, .month, .year], from: searchCriteria.checkinDate)
        if let day = dateComponents.day,
           let month = dateComponents.month,
           let year = dateComponents.year {
            self.checkInDate = RequestDate(day: day, month: month, year: year)
        } else { fatalError("unable to create components from checkInDate") }
        
        dateComponents = calendar.dateComponents([.day, .month, .year], from: searchCriteria.checkoutDate)
        if let day = dateComponents.day,
           let month = dateComponents.month,
           let year = dateComponents.year {
            self.checkOutDate = RequestDate(day: day, month: month, year: year)
        } else { fatalError("unable to create components from checkInDate") }
        
        self.rooms = [
            Room(adults: searchCriteria.adultsCount,
                 children: Array<Room.Children>(repeating: Room.Children(age: 8), count: searchCriteria.childrenCount))
        ]
    }
}

struct HotelList: Decodable {
    let data: HotelListData
}

struct HotelListData: Decodable {
    let propertySearch: HotelPropertySearch
}

struct HotelPropertySearch: Decodable {
    let properties: [HotelProperty]
}

struct HotelProperty: Decodable, Identifiable {
    let id: String
    let name: String
    let propertyImage: PropertyImage
    let price: PropertyPrice
    let reviews: PropertyReview
}

extension HotelProperty {
    static var standard: HotelProperty {
        HotelProperty(id: "ID",
                      name: "Some(Hotel)",
                      propertyImage: PropertyImage(image: ImageData(url: URL(string: "https://images.trvl-media.com/lodging/20000000/19530000/19527200/19527132/393a453a.jpg?impolicy=resizecrop&rw=455&ra=fit")!)),
                      price: PropertyPrice(lead: PropertyPriceLead(amount: 123.4, currencyInfo: PropertyPriceCurrencyInfo(code: "GBP", symbol: "£"), formatted: "£123.40"), priceMessages: [PropertyPriceMessage(value: "Message")]),
                      reviews: PropertyReview(score: 3.89, total: 1))
    }
}

struct PropertyPrice: Decodable {
    let lead: PropertyPriceLead
    let priceMessages: [PropertyPriceMessage]
    
    var formatted: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = lead.currencyInfo.code
        formatter.maximumFractionDigits = 2
        
        let number = NSNumber(value: lead.amount)
        return formatter.string(from: number) ?? "N/A"
    }
}

struct PropertyPriceLead: Decodable {
    let amount: Double
    let currencyInfo: PropertyPriceCurrencyInfo
    let formatted: String
}
struct PropertyPriceMessage: Decodable {
    let value: String
}

struct PropertyPriceCurrencyInfo: Decodable {
    let code: String
    let symbol: String
}

struct PropertyReview: Decodable {
    let score: Double
    let total: Int
    
    var formattedScore: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 1
        numberFormatter.minimumFractionDigits = 1
        return numberFormatter.string(from: NSNumber(value: score)) ?? "N/A"
    }
}

struct ImageData: Decodable {
    let url: URL
}


struct PropertyImage: Decodable {
    let image: ImageData
}
