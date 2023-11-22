//
//  AuthentificationView.swift
//  MoodMe
//
//  Created by Natália Pohanková on 31/01/2023.
//

import SwiftUI

struct AuthenticationView: View {
    @ObservedObject var viewModel: AuthenticationViewModel
    
    let onAuthenticated: () -> (Void)
    
    var body: some View {
        VStack {
            Button {
                viewModel.authenticate()
            } label: {
                Label("Get in with FaceID", systemImage: "faceid")
            }.onChange(of: viewModel.isAuthenticated, perform: { _ in onAuthenticated()}
            )
            if (viewModel.text != nil) {
                Text(viewModel.text!)
            }
        }
    }
}
