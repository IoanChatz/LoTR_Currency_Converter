//
//  CurrencyIcon.swift
//  LOTR Converter
//
//  Created by chatziio on 28/7/23.
//

import SwiftUI

struct CurrencyIcon: View {
    @State var currencyImage: String
    @State var currencyText: String

    var body: some View {
        ZStack {

            // Currency Image
            Image(currencyImage)
                .resizable()
                .scaledToFit()

            VStack {
                Spacer()

                // Text for Image
                Text(currencyText)
                    .padding(3)
                    .font(.caption)
                .background(.brown.opacity(0.75))
            }
        }
        .padding(3)
        .frame(width: 100,height: 100)
        .background(.brown)
        .cornerRadius(25)
    }
}
