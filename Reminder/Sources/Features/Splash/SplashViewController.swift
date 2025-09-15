//
//  SplashViewController.swift
//  Reminder
//
//  Created by Maycon Douglas on 06/09/25.
//

import Foundation
import UIKit


class SplashViewController: UIViewController {
    let contentView = SplashView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGesture()
        
        setup()
    }
    
    private func setup() {
        self.view.addSubview(contentView)
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = Colors.primaryRedBase
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.rightAnchor.constraint(equalTo: view.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showLoginBottomSheet))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func showLoginBottomSheet() {
        let loginBottomSheetViewController = LoginBottomSheetViewController()
        loginBottomSheetViewController.modalPresentationStyle = .overCurrentContext
        loginBottomSheetViewController.modalTransitionStyle = .crossDissolve
        
        self.present(loginBottomSheetViewController, animated: false) {
            loginBottomSheetViewController.animateShow()
        }
    }
}
