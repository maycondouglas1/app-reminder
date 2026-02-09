//
//  ViewControllersFactory.swift
//  Reminder
//
//  Created by Maycon Matias on 18/11/25.
//

import Foundation
import UIKit

final class ViewControllersFactory: ViewControllersFactoryProtocol {
    func makeSplashViewController(flowDelegate: SplashFlowDelegate)
        -> SplashViewController
    {
        let splashView = SplashView()
        let splashViewController = SplashViewController(
            contentView: splashView,
            flowDelegate: flowDelegate)
        return splashViewController
    }

    func makeLoginBottomSheetViewController(
        flowDelegate: LoginBottomSheetFlowDelegate
    ) -> LoginBottomSheetViewController {
        let loginBottomSheetView = LoginBottomSheetView()
        let loginBottomSheetViewController = LoginBottomSheetViewController(
            contentView: loginBottomSheetView, flowDelegate: flowDelegate)

        return loginBottomSheetViewController
    }
    
    func makeHomeViewController(
        flowDelegate: HomeFlowDelegate
    ) -> HomeViewController {
        let homeView = HomeView()
        let homeViewController = HomeViewController(
            contentView: homeView, flowDelegate: flowDelegate)

        return homeViewController
    }
}
