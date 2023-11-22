//
//  MoodMeTests.swift
//  MoodMeTests
//
//  Created by Natália Pohanková on 23/06/2023.
//

import XCTest

@testable import MoodMe

final class MoodMeTests: XCTestCase {
    private struct Dependencies: NewNoteViewModel.Dependencies {
        var notesService: MoodMe.NotesServicing
    }
    
    private var dependencies: Dependencies!
    
    override func setUpWithError() throws {
        dependencies = .init(notesService: NotesServiceMock.init())
    }

    override func tearDownWithError() throws {
        //
    }

    func testAddingNote() throws {
        let notesViewModel = NewNoteViewModel(dependecies: dependencies)
        
        XCTAssertEqual(notesViewModel.notesStorage.getSavedNotes().count, 0)
        
        notesViewModel.onSave()
        
        XCTAssertEqual(notesViewModel.notesStorage.getSavedNotes().count, 1)
    }
    
    func testRemovingNote() throws {
        let addViewModel = NewNoteViewModel(dependecies: dependencies)
        
        addViewModel.onSave()
        addViewModel.onSave()
        
        let notesViewModel = NotesViewModel(dependecies: dependencies)
        
        XCTAssertEqual(notesViewModel.notesStorage.getSavedNotes().count, 2)
        
        notesViewModel.deleteNote(at: .init(arrayLiteral: 1))
                                  
        XCTAssertEqual(notesViewModel.notesStorage.getSavedNotes().count, 1)
        
    }
}


