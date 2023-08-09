//
//  DateInputViewModel.swift
//  ShackleHotelBuddy
//
//  Created by Brian Munjoma on 09/08/2023.
//

import Foundation

final class DateInputViewModel: ObservableObject {
    
    var logo: String
    var title: String
    @Published var formattedInput: String = "DD / MM / YYYY"
    
    init(logo: String,
         title: String) {
        self.logo = logo
        self.title = title
    }
    
    func updateDateText(_ date: Date) {
        let dateFormatter = DateFormatter()
        let dateDisplayFormat = "dd / MM / YYYY"
        dateFormatter.dateFormat = dateDisplayFormat
        formattedInput = dateFormatter.string(from: date)
    }
}
