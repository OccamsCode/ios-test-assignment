//
//  HotelItemView.swift
//  ShackleHotelBuddy
//
//  Created by Brian Munjoma on 09/08/2023.
//

import SwiftUI

struct HotelItemView: View {
    @Environment(\.appTheme) var appTheme
    let hotelProperty: HotelProperty
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: hotelProperty.propertyImage.image.url) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: /*@START_MENU_TOKEN@*/250.0/*@END_MENU_TOKEN@*/)
                    .cornerRadius(appTheme.layout.cornerRadius)
            } placeholder: {
                Image(appTheme.images.background)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: /*@START_MENU_TOKEN@*/250.0/*@END_MENU_TOKEN@*/)
                    .cornerRadius(appTheme.layout.cornerRadius)
            }
            HotelItemInformationView(hotelProperty: hotelProperty)
        }
    }
}

struct HotelItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            Spacer()
            HotelItemView(hotelProperty: .standard)
            Spacer()
        }
        .padding()
    }
}
