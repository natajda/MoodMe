//
//  CalendarLoader.swift
//  MoodMe
//
//  Created by Natália Pohanková on 14/06/2023.
//

import Foundation

class CalendarLoader {
    @Published var calendarData: Array<DateAndName> = []
    
    init() {
        load()
    }
    
    func load() {
        do {
            if let fileLocation = Bundle.main.path(forResource: "nameday" , ofType: "csv") {
                let content = try String(contentsOfFile: fileLocation)
                let parsedCSV: [DateAndName] = content.components(
                    separatedBy: "\n"
                ).map{
                    let line = $0.components(separatedBy: ",")
                    return line.count == 2 ? DateAndName(date: line[0], name: line[1]) : DateAndName(date: "", name: "")
                }
                calendarData = parsedCSV
            }
        }
        catch {
            print("Unable to load namesdays \(error)")
        }
    }
}
