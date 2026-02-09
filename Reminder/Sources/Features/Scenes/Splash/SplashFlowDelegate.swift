//
//  SplashFlowDelegate.swift
//  Reminder
//
//  Created by Maycon Matias on 17/11/25.
//

import Foundation

public protocol SplashFlowDelegate: AnyObject {
    func openLoginBottomSheet()
    func navigateToHome()
}
