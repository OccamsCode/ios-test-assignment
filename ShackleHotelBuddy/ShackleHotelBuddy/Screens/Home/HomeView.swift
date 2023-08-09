//
//  HomeView.swift
//  ShackleHotelBuddy
//
//  Created by Brian Munjoma on 09/08/2023.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    
    @ObservedObject var searchCriteria = SearchCriteriaViewModel()
    
    enum Constants {
        static let bottomPadding = 32.0
    }
    
}

struct HomeView: View {

        @ObservedObject var viewModel: HomeViewModel = HomeViewModel()
        @Environment(\.appTheme) var appTheme
        
        var body: some View {
            NavigationView {
                ZStack {
                    Image(appTheme.images.background)
                        .resizable(resizingMode: .stretch)
                        .edgesIgnoringSafeArea([.all])

                    VStack {
                        HomeHeaderView()
                        Spacer()
                    }
                    
                    VStack {
                        Spacer()
                        SearchCriteriaView(viewModel: viewModel.searchCriteria)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    VStack {
                        Spacer()
                        NavigationLink(destination: HotelListView(viewModel: .init(searchCriteria: viewModel.searchCriteria))) {
                            Text(Localized.Home.Button.text)
                                .font(.title3)
                                .frame(maxWidth: .infinity, maxHeight: appTheme.layout.callToActionSize)
                                .foregroundColor(.white)
                        }
                        .tint(appTheme.colors.primary)
                        .buttonStyle(.borderedProminent)
                        .cornerRadius(appTheme.layout.secondaryCornerRadius)
                        .padding(.horizontal, appTheme.layout.padding)
                        .padding(.bottom)
                    }
                }
            }
        }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
