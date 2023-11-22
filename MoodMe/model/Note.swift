//
//  Note.swift
//  MoodMe
//
//  Created by Natália Pohanková on 25/01/2023.
//

import Foundation

struct Note : Identifiable, Hashable {
    let id: String = UUID().uuidString
    let text: String
    let date: Date
    var dateText: String = ""
    
    static func toDateText () -> String {
        return Date.now.toString(format: "dd.MM.yyyy, HH:mm")
    }
}
