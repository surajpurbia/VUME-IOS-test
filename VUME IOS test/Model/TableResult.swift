//
//  ErrorManager.swift
//  VUME IOS test
//
//  Created by Suraj Purbia on 27/06/21.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let tableResult = try? newJSONDecoder().decode(TableResult.self, from: jsonData)

import Foundation

// MARK: - TableResultElement
struct TableResultElement: Codable {
    let category: Category
    let minBuyin: Int
    let tableID, tableName: String
    let betValue: Double
    let numPlayers, tableLimit, maxBuyin: Int
    let tableType: TableType
    let tableCode: String

    enum CodingKeys: String, CodingKey {
        case category, minBuyin
        case tableID = "tableId"
        case tableName, betValue, numPlayers, tableLimit, maxBuyin, tableType, tableCode
    }
}

enum Category: String, Codable {
    case bestof = "bestof"
    case points = "points"
    case the101Pool = "101-pool"
    case the201Pool = "201-pool"
}

enum TableType: String, Codable {
    case bestof = "bestof"
    case points = "points"
    case pool = "pool"
}

typealias TableResult = [TableResultElement]

