//
//  NotesView.swift
//  MoodMe
//
//  Created by Natália Pohanková on 19/01/2023.
//

import SwiftUI

struct NotesView: View {
    @ObservedObject var viewModel: NotesViewModel
    
    let onNoteTapped: (NoteEntity) -> Void
    
    var body: some View {
        List {
            ForEach(viewModel.savedNotes) { note in
                Button {
                    onNoteTapped(note)
                } label: {
                    VStack(alignment: .leading) {
                        Text(note.text ?? "")
                            .frame(minWidth: 200, alignment: .leading)
                            .lineLimit(1, reservesSpace: false)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        Text(note.dateText ?? "")
                            .frame(minWidth: 200, alignment: .leading)
                            .fontWeight(.light)
                            .foregroundColor(.black)
                    }
                }
            }.onDelete(perform: viewModel.deleteNote)
        }.onAppear(perform: viewModel.fetchData)
    }
}
