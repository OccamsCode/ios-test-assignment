//
//  HotelListViewModel.swift
//  ShackleHotelBuddy
//
//  Created by Brian Munjoma on 09/08/2023.
//

import Foundation

final class HotelListViewModel: ObservableObject {
    
    let service = HotelServiceMock()
    let searchCriteria: SearchCriteriaViewModel
    @Published private(set) var hotels: [HotelProperty]
    
    init(searchCriteria: SearchCriteriaViewModel, hotels: [HotelProperty] = []) {
        self.searchCriteria = searchCriteria
        self.hotels = hotels
    }
    
    func fetch() async {
        
        Task(priority: .background) {
            let result = await service.list(searchCriteria)
            switch result {
            case .success(let list):
                await MainActor.run {
                    hotels = list.data.propertySearch.properties
                }
            case .failure(let error):
                print(error.customMessage)
            }
        }
        
    }
    
}
