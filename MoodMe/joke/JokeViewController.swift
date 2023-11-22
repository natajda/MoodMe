//
//  JokeViewController.swift
//  MoodMe
//
//  Created by Natália Pohanková on 12/06/2023.
//

import UIKit
import SwiftUI

final class JokeViewController: UIViewController {
    private let viewModel = JokeViewModel()
    
    override func loadView() {
        super.loadView()
        
        let rootView = JokeView(
            viewModel: self.viewModel
        )
        let vc = UIHostingController(rootView: rootView)
        embedController(vc)
    }
}
