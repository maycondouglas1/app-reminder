//
//  ReminderFlowController.swift
//  Reminder
//
//  Created by Maycon Matias on 19/09/25.
//

import Foundation
import UIKit

class ReminderFlowController {
    //MARK: - Properties
    private var navigationController: UINavigationController?
    
    public init() {
        
    }
    
    //MARK: - startFlow
    func start() -> UINavigationController? {
        let startViewController = SplashViewController(flowDelegate: self)
        self.navigationController = UINavigationController(rootViewController: startViewController)
        
        return navigationController
    }
}

// MARK: - Login
extension ReminderFlowController: LoginBottomSheetFlowDelegate {
    func navigateToHome() {
        self.navigationController?.dismiss(animated: true)
        let viewController = UIViewController()
        viewController.view.backgroundColor = .red
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

extension ReminderFlowController: SplashFlowDelegate {
    func openLoginBottomSheet() {
        let loginBottomSheetViewController = LoginBottomSheetViewController(flowDelegate: self)
        loginBottomSheetViewController.modalPresentationStyle = .overCurrentContext
        loginBottomSheetViewController.modalTransitionStyle = .crossDissolve
        
        self.navigationController?.present(loginBottomSheetViewController, animated: false) {
            loginBottomSheetViewController.animateShow()
        }
    }
}
