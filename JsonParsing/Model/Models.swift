//
//  File.swift
//  JsonParsing
//
//  Created by Allahverdi Yunusov on 03.09.21.
//

import Foundation


struct Result: Codable {
    let data: [ResultItem]
}

struct ResultItem: Codable {
    let id: Int
    let title: String
    let content: String
}
