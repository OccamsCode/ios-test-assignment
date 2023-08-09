//
//  SearchCriteriaViewModel.swift
//  ShackleHotelBuddy
//
//  Created by Brian Munjoma on 09/08/2023.
//

import SwiftUI

final class SearchCriteriaViewModel: ObservableObject {
    
    @Published var checkinDate: Date
    @Published var checkoutDate: Date
    @State var adultsCount: Int
    @State var childrenCount: Int
    
    @State var checkInDateViewModel: DateInputViewModel
    @State var checkOutDateViewModel: DateInputViewModel
    
    init(checkinDate: Date = .now,
         checkoutDate: Date = .now.addingTimeInterval(86400),
         adultsCount: Int = 1,
         childrenCount: Int = 0) {
        self.checkinDate = checkinDate
        self.checkoutDate = checkoutDate
        self.adultsCount = adultsCount
        self.childrenCount = childrenCount
        
        checkInDateViewModel = DateInputViewModel(logo: "icons/event_upcoming",
                                                  title: Localized.Home.SearchCriteria.CheckInDate.text)
        checkOutDateViewModel = DateInputViewModel(logo: "icons/event_available",
                                                   title: Localized.Home.SearchCriteria.CheckOutDate.text)
    }
    
    lazy var adults = CountInputViewModel(logo: "icons/person",
                                          title: Localized.Home.SearchCriteria.Adults.text,
                                          minValue: 1, inputCount: adultsCount)
    
    lazy var children = CountInputViewModel(logo: "icons/supervisor_account",
                                            title: Localized.Home.SearchCriteria.Children.text,
                                            inputCount: childrenCount)
    
}
