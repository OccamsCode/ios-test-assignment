//
//  HotelItemInformationView.swift
//  ShackleHotelBuddy
//
//  Created by Brian Munjoma on 09/08/2023.
//

import SwiftUI

struct HotelItemInformationView: View {
    @Environment(\.appTheme) var appTheme
    let hotelProperty: HotelProperty
    
    var body: some View {
        VStack(alignment: .leading, spacing: appTheme.layout.stackViewSpacing) {
            HStack {
                Text(hotelProperty.name)
                    .font(.callout)
                    .fontWeight(.bold)
                Spacer()
                Image("icons/grade")
                Text(hotelProperty.reviews.formattedScore)
                    .font(.callout)
            }
            Text("Location -> Neighbourhoods")
                .font(.callout)
                .foregroundColor(appTheme.colors.secondary)
            Text(hotelProperty.price.formatted)
                .font(.caption)
                .padding(.bottom, appTheme.layout.padding)
        }
    }
}


struct HotelItemInformationView_Previews: PreviewProvider {
    static var previews: some View {
        HotelItemInformationView(hotelProperty: .standard)
    }
}
