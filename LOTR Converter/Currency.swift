//
//  Currency.swift
//  LOTR Converter
//
//  Created by Chatzinikolaou Ioannis on 28/7/23.
//

import Foundation

enum Currency: Double, CaseIterable {
    case copperPenny = 640
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1

    func convert(amountString: String, to currency: Currency) -> String {
        guard let startingAmount = Double(amountString) else {
            return ""
        }
        let convertedAmount = (startingAmount / self.rawValue) * currency.rawValue
        if convertedAmount > 0 {
            return String(format: "%.2f", convertedAmount)
        } else {
            return ""
        }
    }
}

enum CurrencyText: String, CaseIterable {
    case copperPenny = "Copper Penny"
    case silverPenny = "Silver Penny"
    case silverPiece = "Silver Piece"
    case goldPenny = "Gold Penny"
    case goldPiece = "Gold piece"
}

enum CurrencyImage: String, CaseIterable {
    case copperPenny = "copperpenny"
    case silverPenny = "silverpenny"
    case silverPiece = "silverpiece"
    case goldPenny = "goldpenny"
    case goldPiece = "goldpiece"
}
