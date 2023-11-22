//
//  AuthenticationViewController.swift
//  MoodMe
//
//  Created by Natália Pohanková on 12/06/2023.
//

import UIKit
import SwiftUI

final class AuthenticationViewController: UIViewController {
    private let viewModel = AuthenticationViewModel()
    
    override func loadView() {
        super.loadView()
        
        let rootView = AuthenticationView(
            viewModel: self.viewModel
            ,
            onAuthenticated: {
                self.onAuthenticated()
            }
        )
        let vc = UIHostingController(rootView: rootView)
        embedController(vc)
    }
    
    func onAuthenticated() {
        if (viewModel.isAuthenticated) {
            let vc = RootViewController()
            
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }
}
