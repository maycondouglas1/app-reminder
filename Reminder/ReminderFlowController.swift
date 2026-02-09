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
    private let viewControllersFactory: ViewControllersFactoryProtocol

    public init() {
        self.viewControllersFactory = ViewControllersFactory()
    }

    //MARK: - startFlow
    func start() -> UINavigationController? {
        let startViewController =
            viewControllersFactory.makeSplashViewController(flowDelegate: self)
        self.navigationController = UINavigationController(
            rootViewController: startViewController)

        return navigationController
    }
}

// MARK: - Login
extension ReminderFlowController: LoginBottomSheetFlowDelegate {
    func navigateToHome() {
        self.navigationController?.dismiss(animated: true)
        let homeViewController = viewControllersFactory.makeHomeViewController(
            flowDelegate: self)
        self.navigationController?.pushViewController(
            homeViewController, animated: true)
    }
}

// MARK: - Splash
extension ReminderFlowController: SplashFlowDelegate {
    func openLoginBottomSheet() {
        let loginBottomSheetViewController =
            viewControllersFactory.makeLoginBottomSheetViewController(
                flowDelegate: self)
        loginBottomSheetViewController.modalPresentationStyle =
            .overCurrentContext
        loginBottomSheetViewController.modalTransitionStyle = .crossDissolve

        self.navigationController?.present(
            loginBottomSheetViewController, animated: false
        ) {
            loginBottomSheetViewController.animateShow()
        }

        func navigateToHome() {
            self.navigationController?.dismiss(animated: true)
            let homeViewController =
                viewControllersFactory.makeHomeViewController(
                    flowDelegate: self)
            self.navigationController?.pushViewController(
                homeViewController, animated: true)
        }
    }
}

// MARK: - Home
extension ReminderFlowController: HomeFlowDelegate {
    func navigateToRecipes() {
        //
    }
    
    func logout() {
        self.navigationController?.popViewController(animated: true)
        self.openLoginBottomSheet()
    }
}
