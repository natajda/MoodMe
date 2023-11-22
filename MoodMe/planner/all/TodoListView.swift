//
//  TodoListView.swift
//  MoodMe
//
//  Created by Natália Pohanková on 16/06/2023.
//

import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel: TodoPersistanceController
    
    var body: some View {
        List {
            ForEach(Period.allCases) { period in
                Section(content: {
                    ForEach(viewModel.sortedTodos(period: period)) { $todo in
                        HStack {
                            Button {
                                viewModel.toggleComplete(todo: todo)
                            } label: {
                                Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle").foregroundColor(.pink)
                            }
                            .buttonStyle(.plain)
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text(todo.title)
                                    .fontWeight(.bold)
                                
                                Text(todo.date.formatted(date: .abbreviated, time: .shortened))
                                    .font(.caption2)
                                    .foregroundStyle(.secondary)
                            }.frame(alignment: .center)
                        }
                    }.onDelete(perform: { indexSet in
                        viewModel.remove(at: indexSet, period: period)
                    })
                }, header: {
                    Text(period.name)
                        .font(.callout)
                        .foregroundColor(.secondary)
                        .fontWeight(.bold)
                })
                .disabled(viewModel.sortedTodos(period: period).isEmpty)
            }
        }.onAppear {
            viewModel.load()
        }
    }
}
