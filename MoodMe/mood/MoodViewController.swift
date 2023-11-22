//
//  MoodViewController.swift
//  MoodMe
//
//  Created by Natália Pohanková on 14/06/2023.
//

import UIKit
import SwiftUI

final class MoodViewController: UIViewController {
    private let viewModel = MoodViewModel()
    
    override func loadView() {
        super.loadView()
        
        let rootView = MoodView(
            viewModel: self.viewModel
        )
        let vc = UIHostingController(rootView: rootView)
        embedController(vc)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Mood"
    }
}
