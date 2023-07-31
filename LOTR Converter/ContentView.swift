//
//  ContentView.swift
//  LOTR Converter
//
//  Created by Chatzinikolaou Ioannis on 28/7/23.
//

import SwiftUI

struct ContentView: View {
    @State var leftAmount: String = ""
    @State var rightAmount: String = ""
    @State var leftAmountTemp: String = ""
    @State var rightAmountTemp: String = ""
    @State var leftTyping: Bool = false
    @State var rightTyping: Bool = false
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    @State var showSelectCurrency: Bool = false
    @State var showExchangeInfo: Bool = false

    var body: some View {
        ZStack {
            // Background Image
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)

            VStack {
                // PonY Image
                Image("prancingpony")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)


                // Currency exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundColor(.white)

                // Currency Conversion
                HStack {
                    // Left section
                    VStack {
                        // Currency
                        HStack {
                            // Currency Image
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)

                            // Currency text
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrency) {
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        }

                        // text field
                        TextField("Amount",
                                  text: $leftAmount, onEditingChanged: {
                            typing in
                            leftTyping = typing
                            leftAmountTemp = leftAmount
                        })
                        .padding(7)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(7)
                        .keyboardType(.decimalPad)
                        .onChange(of: leftTyping ? leftAmount : leftAmountTemp) { _ in
                            rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
                        }
                        .onChange(of: leftCurrency) { _ in
                            leftAmount = rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
                        }
                    }

                    // Mid section( equals sign)
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundColor(.white)

                    // Right section
                    VStack {
                        // Currency
                        HStack {
                            // Currency text
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .foregroundColor(.white)
                                .font(.headline)

                            // Currency Image
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrency) {
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        }

                        // text field
                        TextField("Amount",
                                  text: $rightAmount, onEditingChanged: {
                            typing in
                            rightTyping = typing
                            rightAmountTemp = rightAmount
                        })
                        .padding(7)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(7)
                        .multilineTextAlignment(.trailing)
                        .keyboardType(.decimalPad)
                        .onChange(of: rightTyping ? rightAmount : rightAmountTemp) { _ in
                            leftAmount = rightCurrency.convert(amountString: rightAmount, to: rightCurrency)
                        }
                        .onChange(of: rightCurrency) { _ in
                            rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
                        }
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .cornerRadius(50)

                Spacer()
                // Info Button
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")

                    }   .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.trailing)
                        .sheet(isPresented: $showExchangeInfo) {
                            ExchangeInformations()
                        }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
