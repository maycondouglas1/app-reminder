//
//  HomeView.swift
//  Reminder
//
//  Created by Maycon Matias on 20/01/26.
//

import UIKit

class HomeView: UIView {
    let profileBackground: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.gray600
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let contentBackground: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Metrics.medium
        view.layer.masksToBounds = true
        view.backgroundColor = Colors.gray800
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = Metrics.huge
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        return imageView
    }()
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.font = Typograph.input
        label.text = "home.welcome.label".localized
        label.textColor = Colors.gray200
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Maycon Douglas"
        label.font = Typograph.heading
        label.textColor = Colors.gray100
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let feedBackButton: UIButton = {
        let button = UIButton()
        button.setTitle("home.feedback.button.title".localized, for: .normal)
        button.backgroundColor = Colors.gray100
        button.layer.cornerRadius = Metrics.medium
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(Colors.gray800, for: .normal)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(profileBackground)
        profileBackground.addSubview(profileImage)
        profileBackground.addSubview(welcomeLabel)
        profileBackground.addSubview(nameLabel)
        
        addSubview(contentBackground)
        contentBackground.addSubview(feedBackButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            profileBackground.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            profileBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileBackground.heightAnchor.constraint(equalToConstant: Metrics.backgroundProfileSize),
            
            profileImage.topAnchor.constraint(equalTo: profileBackground.topAnchor, constant: Metrics.huge),
            profileImage.leadingAnchor.constraint(equalTo: profileBackground.leadingAnchor, constant: Metrics.medium),
            profileImage.heightAnchor.constraint(equalToConstant: Metrics.profileImageSize),
            profileImage.widthAnchor.constraint(equalToConstant: Metrics.profileImageSize),
            
            welcomeLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: Metrics.small),
            welcomeLabel.leadingAnchor.constraint(equalTo: profileImage.leadingAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: Metrics.little),
            nameLabel.leadingAnchor.constraint(equalTo: profileImage.leadingAnchor),
            
            contentBackground.topAnchor.constraint(equalTo: profileBackground.bottomAnchor),
            contentBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentBackground.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            feedBackButton.heightAnchor.constraint(equalToConstant: Metrics.buttonHeight),
            feedBackButton.bottomAnchor.constraint(equalTo: contentBackground.bottomAnchor, constant: -Metrics.medium),
            feedBackButton.leadingAnchor.constraint(equalTo: contentBackground.leadingAnchor, constant: Metrics.medium),
            feedBackButton.trailingAnchor.constraint(equalTo: contentBackground.trailingAnchor, constant: -Metrics.medium)
        ])
    }
}
