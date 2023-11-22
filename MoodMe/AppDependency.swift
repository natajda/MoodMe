//
//  AppDependency.swift
//  MoodMe
//
//  Created by Natália Pohanková on 23/06/2023.
//

import Foundation
import CoreData

let appDependencies = AppDependency()

final class AppDependency {
    lazy var notesService: NotesServicing = NotesService(container: NSPersistentContainer(name: "NotesContainer"))
}

protocol HasNoDependency {}

extension AppDependency: HasNotesService {}

