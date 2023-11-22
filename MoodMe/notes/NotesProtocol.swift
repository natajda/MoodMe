//
//  NotesProtocol.swift
//  MoodMe
//
//  Created by Natália Pohanková on 23/06/2023.
//

import Foundation
import CoreData

protocol HasNotesService {
    var notesService: NotesServicing {get}
}

protocol NotesServicing {
    
    var container: NSPersistentContainer { get set }
    
    func fetchData()
    func saveNote(noteField: String)
    func editNote(note: NoteEntity?, newText: String)
    func deleteNote(at indexSet: IndexSet)
    func getSavedNotes() -> [NoteEntity]
}
