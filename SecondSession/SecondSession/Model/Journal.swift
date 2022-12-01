//
//  Journal.swift
//  SecondSession
//
//  Created by Minyoung Kim on 2022/11/27.
//

import SwiftUI

// Journal Model
struct Journal: Identifiable {
    var id = UUID().uuidString
    var emoji: String
    var journaltext: String
    var journalDate: Date
}
