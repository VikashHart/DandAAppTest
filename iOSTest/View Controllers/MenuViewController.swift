//
//  MenuViewController.swift
//  iOSTest
//
//  Created by D & A Technologies on 1/22/18.
//  Copyright © 2018 D & A Technologies. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     *
     * 1) UI must work on iOS phones of multiple sizes. Do not worry about iPads.
     *
     * 2) Use Autolayout to make sure all UI works for each resolution
     *
     * 3) Use this starter project as a base and build upon it. It is ok to remove some of the
     *    provided code if necessary. It is ok to add any classes. This is your project now!
     *
     * 4) Read the additional instructions comments throughout the codebase, they will guide you.
     *
     * 5) Please take care of the bug(s) we left for you in the project as well. Happy hunting!
     *
     * Thank you and Good luck. - D & A Technologies
     * =========================================================================================
     */
    
    // Mark: - Properties
    private let mainMenuView = MainMenuView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureView()
        configureButtons()
    }
    
    private func configureVC() {
        title = "Coding Tasks"
        navigationController?.navigationBar.barTintColor = UIColor.appBlue
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 17, weight: .semibold)]
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = UIColor.white
    }
    
    private func configureButtons() {
        self.mainMenuView.chatButton.addTarget(self, action: #selector(PressChatButton), for: .touchUpInside)
        self.mainMenuView.loginButton.addTarget(self, action: #selector(didPressLoginButton), for: .touchUpInside)
        self.mainMenuView.animationButton.addTarget(self, action: #selector(didPressAnimationButton), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc private func PressChatButton() {
        let chatViewController = ChatViewController()
        navigationController?.pushViewController(chatViewController, animated: true)
    }
    
    @objc private func didPressLoginButton() {
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    @objc private func didPressAnimationButton() {
        let animationViewController = AnimationViewController()
        navigationController?.pushViewController(animationViewController, animated: true)
    }
    
    private func configureView() {
        mainMenuView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainMenuView)
        NSLayoutConstraint.activate([
            mainMenuView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainMenuView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainMenuView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainMenuView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
}
