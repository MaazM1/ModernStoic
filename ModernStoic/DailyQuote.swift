//
//  DailyQuote.swift
//  ModernStoic
//
//  Created by Maaz M on 4/23/24.
//

import Foundation

struct QuoteResponse: Decodable {
    let text: String
    let author: String
}

struct DailyQuote: Decodable {
    let author: String
    let quote: String
}
