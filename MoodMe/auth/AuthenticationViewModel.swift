//
//  AuthenticationViewModel.swift
//  MoodMe
//
//  Created by Natália Pohanková on 12/06/2023.
//

import Foundation
import LocalAuthentication


final class AuthenticationViewModel: ObservableObject {
    @Published var text: String? = ""
    
    @Published var isAuthenticated: Bool = false
    
    @MainActor
    func authenticate() {
        let context = LAContext()
        
        var error: NSError?
        let policy: LAPolicy = .deviceOwnerAuthenticationWithBiometrics
        if context.canEvaluatePolicy(policy, error: &error) {
            context.evaluatePolicy(policy, localizedReason: "App access") {
                [weak self]
                success, error in
                DispatchQueue.main.async {
                    if let error {
                        self?.text = error.localizedDescription
                        self?.isAuthenticated = false
                        return
                    }
                    
                    guard success else { assertionFailure(); return }
                    self?.isAuthenticated = true
                }
            }
        } else {
            // You shall not pass
            self.text = error?.localizedDescription
            self.isAuthenticated = false
        }
    }
}
