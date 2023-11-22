//
//  AddTodoViewModel.swift
//  MoodMe
//
//  Created by Natália Pohanková on 16/06/2023.
//

import Foundation
import SwiftUI

final class AddTodoViewModel: ObservableObject {
    @ObservedObject var todosStorage = TodoPersistanceController.shared
    
    @Published var todo: Todo = Todo()
        
    func onSave() {
        todosStorage.add(todo)
    }
}
