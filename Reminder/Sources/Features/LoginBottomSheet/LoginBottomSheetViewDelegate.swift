//
//  LoginBottomSheetViewDelegate.swift
//  Reminder
//
//  Created by Maycon Matias on 18/09/25.
//

import Foundation
import UIKit

protocol LoginBottomSheetViewDelegate: AnyObject {
    func sendLoginRequest(email: String, password: String)
}
