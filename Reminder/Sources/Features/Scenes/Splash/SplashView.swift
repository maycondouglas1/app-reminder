//
//  SplashView.swift
//  Reminder
//
//  Created by Maycon Douglas on 08/09/25.
//

import Foundation
import UIKit

class SplashView: UIView {
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.addSubview(logoImageView)

        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -Metrics.medium),
            logoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
}
