//
//  HomeViewController.swift
//  Reminder
//
//  Created by Maycon Matias on 20/01/26.
//
import Foundation
import UIKit

class HomeViewController: UIViewController {
    let contentView: HomeView
    public weak var flowDelegate: HomeFlowDelegate?

    init(
        contentView: HomeView,
        flowDelegate: HomeFlowDelegate
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
        setup()
        setupNavigationBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    private func setupNavigationBar() {
        self.navigationItem.hidesBackButton = true
        let logoutButton = UIBarButtonItem(
            image: UIImage(named: "log-out-icon"),
            style: .plain,
            target: self,
            action: #selector(logoutAction))

        logoutButton.tintColor = Colors.primaryRedBase
        navigationItem.rightBarButtonItem = logoutButton
    }

    private func setup() {
        view.addSubview(contentView)
        view.backgroundColor = Colors.gray600
        setupConstraints()
    }

    private func setupConstraints() {
        setupContentViewToBounds(contentView: contentView)
    }

    @objc
    private func logoutAction() {
        UserDefaultsManager.removeUser()
        self.flowDelegate?.logout()
    }
}
