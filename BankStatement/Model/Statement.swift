//
//  Statement.swift
//  BankStatement
//
//  Created by Manab Kumar Mal on 25/06/21.
//
//   let statement = try? newJSONDecoder().decode(Statement.self, from: jsonData)

import Foundation

// MARK: - Statement
struct Statement: Codable {
    let account: Account
    let transactions, pending: [Pending]
    let atms: [ATM]
}

// MARK: - Account
struct Account: Codable {
    let accountName, accountNumber: String
    let available, balance: Double
}

// MARK: - ATM
struct ATM: Codable {
    let id, name, address: String
    let location: Location
}

// MARK: - Location
struct Location: Codable {
    let lat, lng: Double
}

// MARK: - Pending
struct Pending: Codable {
    let id, pendingDescription, effectiveDate: String
    let amount: Double
    let atmID: String?
    var isPending = false

    enum CodingKeys: String, CodingKey {
        case id
        case pendingDescription = "description"
        case effectiveDate, amount
        case atmID = "atmId"
    }
}

let decoder = JSONDecoder()
decoder.keyDecodingStrategy = .
