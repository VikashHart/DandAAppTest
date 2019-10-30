//
//  LoginViewController.swift
//  iOSTest
//
//  Created by D & A Technologies on 1/22/18.
//  Copyright © 2018 D & A Technologies. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Take username and password input from the user using UITextFields
     *
     * 3) Using the following endpoint, make a request to login
     *    URL: http://dev.datechnologies.co/Tests/scripts/login.php
     *    Parameter One: email
     *    Parameter Two: password
     *
     * 4) A valid email is 'info@datechnologies.co'
     *    A valid password is 'Test123'
     *
     * 5) Calculate how long the API call took in milliseconds
     *
     * 6) If the response is an error display the error in a UIAlertView
     *
     * 7) If the response is successful display the success message AND how long the API call took in milliseconds in a UIAlertView
     *
     * 8) When login is successful, tapping 'OK' in the UIAlertView should bring you back to the main menu.
     **/
    
    // MARK: - Properties
    private var client: LoginClientRetrievable = LoginClient()
    private let loginView = LoginView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureView()
        configureButton()
    }
    
    private func configureVC() {
        title = "Login"
        loginView.emailTextField.delegate = self
        loginView.passwordTextField.delegate = self
    }
    
    private func configureButton() {
        loginView.loginButton.addTarget(self,
                                        action: #selector(didPressLoginButton(_:)),
                                        for: .touchUpInside)
    }
    
    @objc private func didPressLoginButton(_ sender: Any) {
        guard loginView.emailTextField.text != "" && loginView.passwordTextField.text != ""
            else { return presentInvalidEntryAlert() }
        
        guard let email = loginView.emailTextField.text, let password = loginView.passwordTextField.text else { return }
        
        let startDate = Date()
        client.login(with: email, password: password) { [weak self] result in
            switch result {
            case .success(let status):
                DispatchQueue.main.async {
                    let executionTime = Date().timeIntervalSince(startDate).rounded(toPlaces: 2)
                    self?.presentLoginAlert(status: status, responseTime: executionTime)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func presentInvalidEntryAlert() {
        let alert = UIAlertController(title: "Invalid email & or password entry. Check and try again", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: { action in
            self.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true)
    }
    
    private func presentLoginAlert(status: LoginModel, responseTime: TimeInterval) {
        switch status.code {
        case "Error":
            let alert = UIAlertController(title: """
                \(status.code)
                
                \(status.message)
                """,
                message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                self.dismiss(animated: true, completion: nil)
            }))
            
            self.present(alert, animated: true)
        case "Success":
            let alert = UIAlertController(title: """
                \(status.code)
                (\(responseTime) seconds)
                
                \(status.message)
                """, message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                self.navigationController?.popToRootViewController(animated: true)
            }))
            
            self.present(alert, animated: true)
        default:
            break
        }
    }
    
    private func configureView() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginView)
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
