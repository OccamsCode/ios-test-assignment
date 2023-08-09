//
//  CountInputView.swift
//  ShackleHotelBuddy
//
//  Created by Brian Munjoma on 09/08/2023.
//

import SwiftUI

struct CountInputView: View {
    @Environment(\.appTheme) var appTheme
    @ObservedObject var viewModel: CountInputViewModel
    
    var body: some View {
        HStack {
            HStack {
                Image(viewModel.logo)
                Text(viewModel.title)
                    .foregroundColor(appTheme.colors.secondary)
            }
            .frame(maxWidth: 200.0, alignment: .leading)
            
            Divider()
            
            Picker(selection: $viewModel.inputCount,
                   label: Text(viewModel.title),
                   content: {
                ForEach(viewModel.minValue..<viewModel.maxValue, id: \.self) { number in
                    Text("\(number)")
                        .tag(number)
                }
            })
            .pickerStyle(.menu)
            .frame(maxWidth: 200.0, alignment: .leading)
            .tint(appTheme.colors.secondary)
        }
        .frame(height: appTheme.layout.buttonSize, alignment: .leading)
        
    }
}

struct CountInputView_Previews: PreviewProvider {
    @StateObject static var viewModel = CountInputViewModel(logo: "icons/person",
                                        title: "Adults",
                                        inputCount: 1)
    static var previews: some View {
        VStack {
            CountInputView(viewModel: viewModel)
        }
    }
}
