//
//  NotesViewController.swift
//  MoodMe
//
//  Created by Natália Pohanková on 13/06/2023.
//

import UIKit
import SwiftUI

final class NotesViewController: UIViewController {
    private let viewModel = NotesViewModel(dependecies: appDependencies)
    
    override func loadView() {
        super.loadView()
        
        let rootView = NotesView(
            viewModel: self.viewModel, onNoteTapped: { [weak self] note in
                self?.onNoteTapped(note)
            }
        )
        let vc = UIHostingController(rootView: rootView)
        embedController(vc)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Notes & Thoughts"
        navigationItem.largeTitleDisplayMode = .automatic
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            style: .plain,
            target: self,
            action: #selector(onPlusTapped)
        )
        
//        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    private func onNoteTapped(_ note: NoteEntity) {
        let vc = EditNoteViewController(viewModel: EditNoteViewModel(dependecies: appDependencies, note: note, noteText: note.text ?? ""))
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @objc
    private func onPlusTapped() {
        let vc = NewNoteViewController(viewModel: NewNoteViewModel(dependecies: appDependencies))
        navigationController?.pushViewController(vc, animated: true)
    }
}
