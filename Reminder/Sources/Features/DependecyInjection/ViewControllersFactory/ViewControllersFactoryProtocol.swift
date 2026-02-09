//
//  ViewControllersFactoryProtocol.swift
//  Reminder
//
//  Created by Maycon Matias on 18/11/25.
//

import Foundation

protocol ViewControllersFactoryProtocol {
    func makeSplashViewController(flowDelegate: SplashFlowDelegate)
        -> SplashViewController
    func makeLoginBottomSheetViewController(
        flowDelegate: LoginBottomSheetFlowDelegate
    ) -> LoginBottomSheetViewController
    func makeHomeViewController(
        flowDelegate: HomeFlowDelegate
    ) -> HomeViewController
}
