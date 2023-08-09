//
//  HotelListHeaderView.swift
//  ShackleHotelBuddy
//
//  Created by Brian Munjoma on 09/08/2023.
//

import SwiftUI

struct HotelListHeaderView: View {
    @Environment(\.appTheme) var appTheme
    
    var body: some View {
        HStack {
            Button(action: {
            }, label: {
                Image("icons/arrow_back")
                    .frame(width: appTheme.layout.buttonSize,
                           height: appTheme.layout.buttonSize)
                    .foregroundColor(.black)
                    .background(appTheme.colors.tertiary)
                    .clipShape(Circle())
            })
            Spacer()
            Text(Localized.HotelList.Header.text)
            Spacer()
            Button(action: {
            }, label: {
                Image("icons/discover_tune")
                    .frame(width: appTheme.layout.buttonSize,
                           height: appTheme.layout.buttonSize)
                    .foregroundColor(.black)
                    .background(appTheme.colors.tertiary)
                    .clipShape(Circle())
            })
        }
        .padding(.horizontal, appTheme.layout.padding)
    }
}

struct ListHotelHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HotelListHeaderView()
    }
}
