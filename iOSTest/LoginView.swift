//
//  LoginView.swift
//  iOSTest
//
//  Created by C4Q on 10/26/19.
//  Copyright © 2019 D&ATechnologies. All rights reserved.
//

import UIKit

class LoginView: UIView {
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "img_login")
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var buttonContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField.getLoginTextField(placeholderString: "Email")
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField.getLoginTextField(placeholderString: "Password")
        return tf
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton.getBlueButton(titleString: "LOGIN")
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
        setupEmailTextField()
        setupPasswordTextField()
        setupLoginButton()
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
            buttonContainerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 64),
            buttonContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            buttonContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
            ])
    }
    
    private func setupEmailTextField() {
        buttonContainerView.addSubview(emailTextField)
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: topAnchor, constant: 64),
            emailTextField.leadingAnchor.constraint(equalTo: buttonContainerView.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: buttonContainerView.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 55)
            ])
    }
    
    private func setupPasswordTextField() {
        buttonContainerView.addSubview(passwordTextField)
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 24),
            passwordTextField.leadingAnchor.constraint(equalTo: buttonContainerView.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: buttonContainerView.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 55)
            ])
    }
    
    private func setupLoginButton() {
        buttonContainerView.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 24),
            loginButton.leadingAnchor.constraint(equalTo: buttonContainerView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: buttonContainerView.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 55),
            loginButton.bottomAnchor.constraint(equalTo: buttonContainerView.bottomAnchor)
            ])
    }
}
