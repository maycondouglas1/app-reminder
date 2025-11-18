//
//  LoginBottomSheetViewModel.swift
//  Reminder
//
//  Created by Maycon Matias on 18/09/25.
//

import Foundation
import Firebase

class LoginBottomSheetViewModel {
    var successResult: (() -> Void)?
    
    func doAuth(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                print("Erro na autenticação: \(error)")
            } else {
                self?.successResult?()
            }
        }
    }
}
