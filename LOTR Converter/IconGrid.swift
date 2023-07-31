//
//  IconGrid.swift
//  LOTR Converter
//
//  Created by Chatzinikolaou Ioannis on 28/7/23.
//

import SwiftUI

struct IconGrid: View {
    @State var gridLayout: [GridItem] = [GridItem(),GridItem(),GridItem()]
    @Binding var currency: Currency

    var body: some View {
        LazyVGrid(columns: gridLayout) {
            ForEach(0..<5) { item in
                if Currency.allCases[item] == currency {
                    CurrencyIcon(currencyImage: CurrencyImage.allCases[item].rawValue, currencyText: CurrencyText.allCases[item].rawValue)
                        .overlay(RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 3)
                            .opacity(0.5)
                            .shadow(color: .black, radius: 9))
                } else {
                    CurrencyIcon(currencyImage: CurrencyImage.allCases[item].rawValue, currencyText: CurrencyText.allCases[item].rawValue)
                        .onTapGesture {
                            currency = Currency.allCases[item]
                        }
                }
            }
        }
        .padding([.bottom, .leading, .trailing])
    }
}

struct IconGrid_Previews: PreviewProvider {
    static var previews: some View {
        IconGrid(currency: .constant(.silverPiece))
    }
}
