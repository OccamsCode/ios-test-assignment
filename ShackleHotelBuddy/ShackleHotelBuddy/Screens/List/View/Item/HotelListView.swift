//
//  HotelListView.swift
//  ShackleHotelBuddy
//
//  Created by Brian Munjoma on 09/08/2023.
//

import SwiftUI

struct HotelListView: View {
    
    @ObservedObject var viewModel: HotelListViewModel
    
    var body: some View {
        VStack {
            HotelListHeaderView()
            VStack {
                if viewModel.hotels.isEmpty {
                    ProgressView()
                } else {
                    List(viewModel.hotels) { hotel in
                        HotelItemView(hotelProperty: hotel)
                    }
                    .listStyle(.plain)
                }
            }
        }
        .onAppear {
            Task {
               await viewModel.fetch()
            }
        }
    }
}

struct ListHotelView_Previews: PreviewProvider {
    
    @State static var viewModel = HotelListViewModel(searchCriteria: SearchCriteriaViewModel(),
                                                     hotels: [.standard])
    
    static var previews: some View {
        HotelListView(viewModel: viewModel)
    }
}
