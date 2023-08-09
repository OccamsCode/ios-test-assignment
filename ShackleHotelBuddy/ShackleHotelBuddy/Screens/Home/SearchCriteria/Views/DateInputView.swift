//
//  DateInputView.swift
//  ShackleHotelBuddy
//
//  Created by Brian Munjoma on 09/08/2023.
//

import SwiftUI

struct DateInputView: View {
    
    @Binding var selectedDate: Date
    @Binding var startDate: Date
    
    @StateObject var viewModel: DateInputViewModel
    @Environment(\.appTheme) var appTheme
    
    var body: some View {
        HStack {
            HStack(spacing: 10.0) {
                Image(viewModel.logo)
                Text(viewModel.title)
                    .foregroundColor(appTheme.colors.secondary)
            }
            .frame(maxWidth: 200.0, alignment: .leading)
            
            Divider()
            
            Text(viewModel.formattedInput)
                .foregroundColor(appTheme.colors.secondary)
                .padding(.leading)
                .overlay {
                    DatePicker(viewModel.title,
                               selection: $selectedDate,
                               in: startDate...,
                               displayedComponents: [.date])
                    .blendMode(.destinationOver)
                    .foregroundColor(appTheme.colors.secondary)
                    .accentColor(appTheme.colors.primary)
                    .tint(appTheme.colors.primary)
                    .onChange(of: selectedDate) { newValue in
                        viewModel.updateDateText(newValue)
                    }
                }
                .frame(maxWidth: 200, alignment: .leading)
        }
        .frame(height: appTheme.layout.callToActionSize, alignment: .leading)
    }
}

struct DateInputView_Previews: PreviewProvider {
    
    @State static var viewModel = DateInputViewModel(logo: "icons/event_upcoming",
                                                     title: "Check-in date")
    
    static var previews: some View {
        DateInputView(selectedDate: .constant(Date()),
                      startDate: .constant(Date()),
                      viewModel: viewModel)
    }
}
