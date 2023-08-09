//
//  HomeHeaderView.swift
//  ShackleHotelBuddy
//
//  Created by Brian Munjoma on 09/08/2023.
//

import SwiftUI

struct HomeHeaderView: View {
    @Environment(\.appTheme) var appTheme
    
    private enum Constants {
        static let profileLogoName =  "icons/person"
    }
    
    var body: some View {
        HStack {
            Image(appTheme.images.logo)
                .padding(.leading, appTheme.layout.padding)
            Spacer()
            Image(Constants.profileLogoName)
                .background {
                    RoundedRectangle(cornerRadius: appTheme.layout.cornerRadius, style: .continuous)
                        .fill(.white)
                        .frame(width: appTheme.layout.buttonSize, height: appTheme.layout.buttonSize)
                }
                .foregroundColor(appTheme.colors.secondary)
                .padding(.trailing, appTheme.layout.padding)
        }
        .padding([.top, .horizontal], appTheme.layout.padding)
        
    }
}

struct HomeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            HomeHeaderView()
            Spacer()
        }
        .background(.gray)
    }
}
