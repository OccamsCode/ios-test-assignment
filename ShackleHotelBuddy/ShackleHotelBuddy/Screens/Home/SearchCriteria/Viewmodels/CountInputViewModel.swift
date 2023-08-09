//
//  CountInputViewModel.swift
//  ShackleHotelBuddy
//
//  Created by Brian Munjoma on 09/08/2023.
//

import Foundation

final class CountInputViewModel: ObservableObject {
    
    init(logo: String,
         title: String,
         minValue: Int = 0,
         maxValue: Int = 11,
         inputCount: Int) {
        self.logo = logo
        self.title = title
        self.inputCount = inputCount
        self.minValue = minValue
        self.maxValue = maxValue
    }
    
    var logo: String
    var title: String
    @Published var inputCount: Int
    let minValue: Int
    let maxValue: Int
}
