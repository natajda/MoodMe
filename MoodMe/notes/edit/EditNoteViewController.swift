//
//  EditNoteViewController.swift
//  MoodMe
//
//  Created by Natália Pohanková on 13/06/2023.
//

import UIKit
import SwiftUI

final class EditNoteViewController: UIViewController {
    private let viewModel: EditNoteViewModel
    
    init(viewModel: EditNoteViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()

        let rootView = EditNoteView(viewModel: self.viewModel)
        let vc = UIHostingController(rootView: rootView)
        embedController(vc)
    }

}
