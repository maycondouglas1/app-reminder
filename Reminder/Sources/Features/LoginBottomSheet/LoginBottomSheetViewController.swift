//
//  LoginBottomSheetViewController.swift
//  Reminder
//
//  Created by Maycon Douglas on 09/09/25.
//

import Foundation
import UIKit

class LoginBottomSheetViewController: UIViewController {
    let contentView: LoginBottomSheetView
    let contentViewModel = LoginBottomSheetViewModel()
    let handleAreaHeight: CGFloat = 50.0
    public weak var flowDelegate: LoginBottomSheetFlowDelegate?
    
    init(
        contentView: LoginBottomSheetView,
        flowDelegate: LoginBottomSheetFlowDelegate
    ) {
        self.flowDelegate = flowDelegate
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.delegate = self
        setup()
        setupGesture()
        bindViewModel()
    }
    
    private func setup() {
        self.view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(
                equalTo: self.view.leadingAnchor),
            contentView.trailingAnchor.constraint(
                equalTo: self.view.trailingAnchor),
            contentView.bottomAnchor.constraint(
                equalTo: self.view.bottomAnchor),
        ])
        
        let heightConstraint =
        contentView.heightAnchor.constraint(
            equalTo: self.view.heightAnchor, multiplier: 0.5
        ).isActive = true
    }
    
    private func bindViewModel() {
        contentViewModel.successResult = { [weak self] email in
            self?.presentSaveUserAlert(email: email)
        }
        
        contentViewModel.errorLogin = { [weak self] message in
            self?.presentErrorAlert(message: message)
        }
    }
    
    private func presentErrorAlert (message: String) {
        let alertController = UIAlertController(
            title: "Erro ao logar",
            message: message,
            preferredStyle: .alert
        )
        
        let retryAction = UIAlertAction(title: "Tentar novamente", style: .cancel)
        alertController.addAction(retryAction)
        self.present(alertController, animated: true)
    }
    
    private func presentSaveUserAlert(email: String) {
        let alertController = UIAlertController(
            title: "Salvar Acesso",
            message: "Deseja salvar o seu acesso?",
            preferredStyle: .alert
        )
        
        let saveAction = UIAlertAction(title: "Salvar", style: .default) { _ in
            let user = User(email: email, isUserSaved: true)
            UserDefaultsManager.saveUser(user: user)
            self.flowDelegate?.navigateToHome()
        }
        
        let cancelAction = UIAlertAction(title: "Não", style: .cancel) { _ in
            self.flowDelegate?.navigateToHome()
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true)
    }
    
    private func setupGesture() {
        
    }
    
    private func handlePanGesture() {
        
    }
    
    public func animateShow(completion: (() -> Void)? = nil) {
        self.view.layoutIfNeeded()
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = Metrics.tiny
        contentView.transform = CGAffineTransform(
            translationX: 0, y: contentView.frame.height)
        UIView.animate(
            withDuration: 0.3,
            animations: {
                self.contentView.transform = .identity
                self.view.layoutIfNeeded()
            }
        ) { _ in
            completion?()
        }
    }
}

extension LoginBottomSheetViewController: LoginBottomSheetViewDelegate {
    func sendLoginRequest(email: String, password: String) {
        contentViewModel.doAuth(email: email, password: password)
    }
}
