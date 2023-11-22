//
//  MoodViewModel.swift
//  MoodMe
//
//  Created by Natália Pohanková on 14/06/2023.
//

import Foundation
import SwiftUI

enum MoodState {
    case notPicked
    case isHappy
    case isLoved
    case isSad
    case isAngry
}

final class MoodViewModel: ObservableObject {
    
    @Published var moodState: MoodState = .notPicked
    
    @AppStorage("happy") var happy = 0
    @AppStorage("loved") var loved = 0
    @AppStorage("sad") var sad = 0
    @AppStorage("angry") var angry = 0
    
    func onMoodPicked(mood: MoodState) {
        switch mood {
        case .isHappy:
            happy += 1
            moodState = .isHappy
        case .isLoved:
            loved += 1
            moodState = .isLoved
        case .isSad:
            sad += 1
            moodState = .isSad
        case .isAngry:
            angry += 1
            moodState = .isAngry
        case .notPicked:
            moodState = .notPicked
            break
        }
    }
    
    func onReset() {
        happy = 0
        loved = 0
        sad = 0
        angry = 0
        moodState = .notPicked
    }
}
