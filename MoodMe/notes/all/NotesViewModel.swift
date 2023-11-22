//
//  NotesViewModel.swift
//  MoodMe
//
//  Created by Natália Pohanková on 13/06/2023.
//

import SwiftUI

final class NotesViewModel: ObservableObject {
    typealias Dependencies = HasNotesService
    
    @Published var savedNotes: [NoteEntity] = []
    
    let notesStorage: NotesServicing
    
    init(dependecies: Dependencies) {
        self.notesStorage = dependecies.notesService
    }
    
    func fetchData() {
        notesStorage.fetchData()
        savedNotes = notesStorage.getSavedNotes()
    }
    
    func deleteNote(at indexSet: IndexSet) {
        notesStorage.deleteNote(at: indexSet)
    }
}
