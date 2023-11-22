//
//  NewNoteViewModel.swift
//  MoodMe
//
//  Created by Natália Pohanková on 13/06/2023.
//

import SwiftUI

final class NewNoteViewModel: ObservableObject {
    typealias Dependencies = HasNotesService
    
    @Published var noteField: String = ""
    
    let notesStorage: NotesServicing
    
    init(dependecies: Dependencies) {
        self.notesStorage = dependecies.notesService
    }
    
    func onSave() {
        notesStorage.saveNote(noteField: noteField)
    }
}
