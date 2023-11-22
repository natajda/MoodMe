//
//  Todo.swift
//  MoodMe
//
//  Created by Natália Pohanková on 16/06/2023.
//

import Foundation

struct Todo: Identifiable, Hashable, Codable {
    var id: String = UUID().uuidString
    var title: String = ""
    var date = Date.now
    var description: String = ""
    var isCompleted = false
    
    var period: Period {
        if date < Date.now{
            return .past
            
        } else if date < Date.now.sevenDaysOut {
            return .nextSevenDays
            
        } else if date < Date.now.thirtyDaysOut {
            return .nextThirtyDays
            
        } else {
            return .future
        }
    }
}

enum Period: String, CaseIterable, Identifiable {
    case nextSevenDays = "Next 7 Days"
    case nextThirtyDays = "Next 30 Days"
    case future = "Future"
    case past = "Past"
    
    var id: String { self.rawValue }
    var name: String { self.rawValue }
}
