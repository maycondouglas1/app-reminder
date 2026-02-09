//
//  HomeFlowDelegate.swift
//  Reminder
//
//  Created by Maycon Matias on 20/01/26.
//

import Foundation

public protocol HomeFlowDelegate: AnyObject {
    func navigateToRecipes()
    func logout()
}
