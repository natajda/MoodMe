//
//  OverviewViewModel.swift
//  MoodMe
//
//  Created by Natália Pohanková on 12/06/2023.
//

import Foundation

final class OverviewViewModel : ObservableObject {
    
    @Published var currentDate: String = ""
    
    let namedays = CalendarLoader()
    
    let timeFormat = "HH:mm"
    
    let clockTimer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
        
    func getTodaysNameday() -> String {
        let dateAndMonth = Date.now.toString(format: "MM-dd")
        
        for date in namedays.calendarData {
            if (date.date == dateAndMonth){
                return date.name
            }
        }
        return ""
    }
}


