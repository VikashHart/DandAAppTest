//
//  MainMenuView.swift
//  iOSTest
//
//  Created by C4Q on 10/24/19.
//  Copyright © 2019 D&ATechnologies. All rights reserved.
//

import UIKit

class MainMenuView: UIView {
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "bg_home_menu")
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var buttonContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var chatButton: UIButton = {
        let button = UIButton.getMainMenuButton(imageString: "ic_chat", titleString: "CHAT")
        return button
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton.getMainMenuButton(imageString: "ic_login", titleString: "LOGIN")
        return button
    }()
    
    lazy var animationButton: UIButton = {
        let button = UIButton.getMainMenuButton(imageString: "ic_animation", titleString: "ANIMATION")
        return button
    }()
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        setupBackgroundImageView()
        setupButonContainer()
        setupChatButton()
        setupLoginButton()
        setupAnimationButton()
    }
    
    private func setupBackgroundImageView() {
        addSubview(backgroundImageView)
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
    
    private func setupButonContainer() {
        addSubview(buttonContainerView)
        NSLayoutConstraint.activate([
            buttonContainerView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            buttonContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            buttonContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
            ])
    }
    
    private func setupChatButton() {
        buttonContainerView.addSubview(chatButton)
        NSLayoutConstraint.activate([
            chatButton.topAnchor.constraint(equalTo: buttonContainerView.topAnchor),
            chatButton.leadingAnchor.constraint(equalTo: buttonContainerView.leadingAnchor),
            chatButton.trailingAnchor.constraint(equalTo: buttonContainerView.trailingAnchor),
            chatButton.heightAnchor.constraint(equalToConstant: 55)
            ])
    }
    
    private func setupLoginButton() {
        buttonContainerView.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: chatButton.bottomAnchor, constant: 24),
            loginButton.leadingAnchor.constraint(equalTo: buttonContainerView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: buttonContainerView.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 55)
            ])
    }
    
    private func setupAnimationButton() {
        buttonContainerView.addSubview(animationButton)
        NSLayoutConstraint.activate([
            animationButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 24),
            animationButton.leadingAnchor.constraint(equalTo: buttonContainerView.leadingAnchor),
            animationButton.trailingAnchor.constraint(equalTo: buttonContainerView.trailingAnchor),
            animationButton.heightAnchor.constraint(equalToConstant: 55),
            animationButton.bottomAnchor.constraint(equalTo: buttonContainerView.bottomAnchor)
            ])
    }
}
