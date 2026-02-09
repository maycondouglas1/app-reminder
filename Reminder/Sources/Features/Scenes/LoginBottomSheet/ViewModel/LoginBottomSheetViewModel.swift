//
//  LoginBottomSheetViewModel.swift
//  Reminder
//
//  Created by Maycon Matias on 18/09/25.
//

import Foundation
import Firebase

class LoginBottomSheetViewModel {
    var successResult: ((String) -> Void)?
    var errorLogin: ((String) -> Void)?
    
    func doAuth(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                self?.errorLogin?(error.localizedDescription)
            } else {
                self?.successResult?(email)
            }
        }
    }
}
