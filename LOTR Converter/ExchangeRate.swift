//
//  ExchangeRate.swift
//  LOTR Converter
//
//  Created by Chatzinikolaou Ioannis on 28/7/23.
//

import SwiftUI

struct ExchangeRate: View {
    @State var leftImage: String
    @State var textInfo: String
    @State var rightImage: String

    var body: some View {
        HStack {
            // Left Currency Image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)

            // Exchange Rates Text
            Text(textInfo)
            // Right Currency Image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}
