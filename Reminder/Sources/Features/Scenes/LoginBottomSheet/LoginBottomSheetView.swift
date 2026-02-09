//
//  LoginBottomSheetView.swift
//  Reminder
//
//  Created by Maycon Douglas on 09/09/25.
//

import Foundation
import UIKit

class LoginBottomSheetView: UIView {
    public weak var delegate: LoginBottomSheetViewDelegate?
    
    private let bottomSheetTitle: UILabel = {
        let label = UILabel()
        label.text = "login.label.title".localized
        label.font = Typograph.subHeading
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "login.email.placeholder".localized
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "login.password.placeholder".localized
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let emailTextFieldLabel: UILabel = {
        let label = UILabel()
        label.text = "login.label.emailTextField".localized
        label.font = Typograph.label
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let passwordTextFieldLabel: UILabel = {
        let label = UILabel()
        label.text = "login.label.passwordTextField".localized
        label.font = Typograph.label
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = Metrics.cornerRadius
        button.backgroundColor = Colors.primaryRedBase
        button.tintColor = .white
        button.titleLabel?.font = Typograph.subHeading
        button.setTitle("login.button.title".localized, for: .normal)
        button.addTarget(self, action: #selector(loginButtonDidTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(bottomSheetTitle)
        addSubview(emailTextFieldLabel)
        addSubview(emailTextField)
        addSubview(passwordTextFieldLabel)
        addSubview(passwordTextField)
        addSubview(loginButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            bottomSheetTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.huge),
            bottomSheetTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            bottomSheetTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            
            emailTextFieldLabel.topAnchor.constraint(equalTo: bottomSheetTitle.bottomAnchor, constant: Metrics.medium),
            emailTextFieldLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            emailTextFieldLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            
            emailTextField.topAnchor.constraint(equalTo: emailTextFieldLabel.bottomAnchor, constant: Metrics.tiny),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            emailTextField.heightAnchor.constraint(equalToConstant: Metrics.inputHeight),
            
            passwordTextFieldLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Metrics.medium),
            passwordTextFieldLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            passwordTextFieldLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldLabel.bottomAnchor, constant: Metrics.tiny),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            passwordTextField.heightAnchor.constraint(equalToConstant: Metrics.inputHeight),
            
            loginButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Metrics.huge),
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            loginButton.heightAnchor.constraint(equalToConstant: Metrics.buttonHeight)
        ])
    }
    
    @objc
    private func loginButtonDidTapped() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        delegate?.sendLoginRequest(email: email, password: password)
    }
}
