//
//  SelectCurrency.swift
//  LOTR Converter
//
//  Created by Chatzinikolaou Ioannis on 28/7/23.
//

import SwiftUI

struct SelectCurrency: View {
    
    @Binding var leftCurrency: Currency
    @Binding var rightCurrency: Currency
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            // Background Image
            Image("parchment")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)

            VStack {
                // Title
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)

                // Currency Icons
                IconGrid(currency: $leftCurrency)

                // title
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)

                // something resuable
                IconGrid(currency: $rightCurrency)

                // Button
                Button("Done") {
                    dismiss()
                }
                .font(.largeTitle)
                .padding(10)
                .foregroundColor(.white)
                .background(.brown)
                .cornerRadius(15)
            }
        }
    }
}

struct SelectCurrency_Previews: PreviewProvider {
    static var previews: some View {
        SelectCurrency(leftCurrency: .constant(.silverPiece), rightCurrency: .constant(.goldPiece))
    }
}
