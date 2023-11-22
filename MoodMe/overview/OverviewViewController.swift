//
//  OverviewViewController.swift
//  MoodMe
//
//  Created by Natália Pohanková on 12/06/2023.
//

import UIKit
import SwiftUI

final class OverviewViewController: UIViewController {
    private let viewModel = OverviewViewModel()
    
    override func loadView() {
        super.loadView()
        
        let rootView = OverviewView(
            viewModel: self.viewModel
        )
        let vc = UIHostingController(rootView: rootView)
        embedController(vc)
    }
}
