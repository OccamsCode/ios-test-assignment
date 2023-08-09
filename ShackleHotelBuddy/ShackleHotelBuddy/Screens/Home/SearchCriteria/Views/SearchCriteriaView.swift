//
//  SearchCriteriaView.swift
//  ShackleHotelBuddy
//
//  Created by Brian Munjoma on 09/08/2023.
//

import SwiftUI

struct SearchCriteriaView: View {
    @Environment(\.appTheme) var appTheme
    @ObservedObject var viewModel: SearchCriteriaViewModel
    
    var body: some View {
        VStack {
            Text(Localized.Home.SearchCriteria.text)
                .font(.largeTitle)
                .fontWeight(.medium)
                .foregroundColor(.white)
            VStack {
                DateInputView(selectedDate: $viewModel.checkinDate,
                              startDate: .constant(Date()),
                              viewModel: viewModel.checkInDateViewModel)
                Divider()
                DateInputView(selectedDate: $viewModel.checkoutDate,
                              startDate: $viewModel.checkinDate,
                              viewModel: viewModel.checkOutDateViewModel)
                Divider()
                CountInputView(viewModel: viewModel.adults)
                Divider()
                CountInputView(viewModel: viewModel.children)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: appTheme.layout.secondaryCornerRadius,
                                 style: .continuous)
                    .foregroundColor(.white)
            )
            .padding(.horizontal)
        }
    }
}

struct SearchCriteriaView_Previews: PreviewProvider {
    
    @StateObject static var viewModel = SearchCriteriaViewModel()
    
    static var previews: some View {
        VStack {
            Spacer()
            SearchCriteriaView(viewModel: viewModel)
            Spacer()
        }
        .background(Color.gray)
    }
}
