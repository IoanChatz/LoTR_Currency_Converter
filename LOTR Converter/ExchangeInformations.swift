//
//  ExchangeInformations.swift
//  LOTR Converter
//
//  Created by Chatzinikolaou Ioannis on 28/7/23.
//

import SwiftUI

struct ExchangeInformations: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            // Background Image
            Image("parchment")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)

            VStack {

                // Text Excange Title
                Text("Exchange Rates")
                    .font(.largeTitle)

                // Text Exchange Rates Body
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title2)
                    .padding()

                // Visual Rates info
                ExchangeRate(leftImage: "goldpiece", textInfo: "1 Gold Piece = 4 Gold Pennies", rightImage: "silverpiece")
                ExchangeRate(leftImage: "goldpenny", textInfo: "1 Gold Penny = 4 Silver Pieces", rightImage: "silverpiece")
                ExchangeRate(leftImage: "silverpiece", textInfo: "1 Silver Piece = 4 Silver Pennies", rightImage: "silverpenny")
                ExchangeRate(leftImage: "silverpenny", textInfo: "1 Silver Penny = 100 Copper Pennies", rightImage: "copperpenny")

                // Done Button Return
                Button("Done") {
                    dismiss()
                }
                .font(.largeTitle)
                .padding(10)
                .foregroundColor(.white)
                .background(.brown)
                .cornerRadius(15)
            }
            .foregroundColor(.black)
        }
    }
}

struct ExchangeInformations_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeInformations()
    }
}
