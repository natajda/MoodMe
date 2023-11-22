//
//  TodoListViewController.swift
//  MoodMe
//
//  Created by Natália Pohanková on 16/06/2023.
//

import UIKit
import SwiftUI

final class TodoListViewController: UIViewController {
    private let viewModel = TodoPersistanceController.shared
    
    override func loadView() {
        super.loadView()
        
        let rootView = TodoListView(
            viewModel: self.viewModel
        )
        let vc = UIHostingController(rootView: rootView)
        embedController(vc)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "My tasks"
        navigationItem.largeTitleDisplayMode = .automatic
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            style: .plain,
            target: self,
            action: #selector(onPlusTapped)
        )
    }
    
    @objc
    private func onPlusTapped() {
        let vc = AddTodoViewController(viewModel: AddTodoViewModel())
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC, animated: true)
    }
}
