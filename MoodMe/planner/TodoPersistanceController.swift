//
//  TodoPersistanceController.swift
//  MoodMe
//
//  Created by Natália Pohanková on 16/06/2023.
//

import Foundation
import SwiftUI

final class TodoPersistanceController: ObservableObject {
    
    static let shared = TodoPersistanceController()
    
    @Published var todos: [Todo] = []
    
    let tasksUrl = "Todos.data"
    
    init() {
        loadFromFileSystem()
    }
    
    private func loadFromFileSystem() {
        let documentDirectory = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask
        ).first
        let url = documentDirectory?.appendingPathExtension(tasksUrl)
        
        guard let url = url else { return }
        
        do {
            let data = try Data(contentsOf: url)
            
            do {
                todos = try JSONDecoder().decode([Todo].self, from: data)
            } catch {
                print("TODOS DECODING ERROR:", error.localizedDescription)
            }
        } catch {
            print("TODOS LOADING ERROR:", error.localizedDescription)
        }
    }
    
    private func saveToFileSystem(todos: [Todo]) {
        let documentDirectory = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask
        ).first
        let url = documentDirectory?.appendingPathExtension(tasksUrl)
        let data = try? JSONEncoder().encode(todos)
        
        if let url = url, let data = data {
            do {
                try data.write(to: url)
            } catch {
                print("TODOS SAVE ERROR:", error.localizedDescription)
            }
        }
    }
    
    func add(_ task: Todo) {
        todos.append(task)
        saveToFileSystem(todos: todos)
        loadFromFileSystem()
    }
    
    func remove(at indexSet: IndexSet, period: Period) {
        let sorted = sortedTodos(period: period)
        
        var ids: [String] = []
        
        for i in indexSet {
            ids.append(sorted[i].id)
        }
        
        todos.removeAll { todo in
            ids.contains(todo.id)
        }
        
        saveToFileSystem(todos: todos)
        loadFromFileSystem()
    }
    
    func sortedTodos(period: Period) -> Binding<[Todo]> {
        Binding<[Todo]>(
            get: {
                self.todos
                    .filter { $0.period == period}
                    .sorted { $0.date < $1.date }
            },
            set: { todos in
                for todo in todos {
                    if let index = self.todos.firstIndex(where: { $0.id == todo.id }) {
                        self.todos[index] = todo
                    }
                }
            }
        )
    }
    
    func load() {
        loadFromFileSystem()
    }
    
    func toggleComplete(todo: Todo) {
        let index = todos.firstIndex(of: todo)
        guard index == nil else {
            todos[index!].isCompleted.toggle()
            saveToFileSystem(todos: todos)
            return
        }
    }
}
