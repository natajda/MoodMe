//
//  AddTodoViewController.swift
//  MoodMe
//
//  Created by Natália Pohanková on 16/06/2023.
//

import UIKit
import SwiftUI

final class AddTodoViewController: UIViewController {
    private let viewModel: AddTodoViewModel
    
    init(viewModel: AddTodoViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        let rootView = AddTodoView(
            viewModel: self.viewModel
        )
        let vc = UIHostingController(rootView: rootView)
        embedController(vc)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Add new task"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Cancel", style: .done, target: self, action: #selector(dismissNew))
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Save", style: .plain, target: self, action: #selector(saveNew))
    }
    
    @objc
    func dismissNew() {
        self.dismiss(animated: true)
    }
    
    @objc
    func saveNew() {
        viewModel.onSave()
        self.dismiss(animated: true)
    }
}
