//
//  LoginViewController.swift
//  nors-dark
//
//  Created by Neo Mode on 09.02.2022.
//

import UIKit

final class LoginViewController: UIViewController {

	private let textLabel = UILabel()
	private let emailField = TextField()
	private let passwordField = TextField()
	private let loginButton = Button(style: .blue, title: "Login")
	private let signUpView = AuthTextView(text: "need an account?", buttonText: "Sign Up", tag: 1)
	private let forgotPasswordView = AuthTextView(text: "forgot your password?", buttonText: "Retrive", tag: 2)

	private let textFieldDelegate = TextFieldDelegate()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = Colors.black
		textFieldDelegate.view = view

		textLabel.font = .SF_medium(size: 10)
		textLabel.textColor = Colors.darkGray
		textLabel.text = "LOGIN WITH"
		textLabel.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(textLabel)

		emailField.delegate = textFieldDelegate
		emailField.placeholder = "Email"
		emailField.keyboardType = .emailAddress
		emailField.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(emailField)

		passwordField.delegate = textFieldDelegate
		passwordField.placeholder = "Password"
		passwordField.isSecureTextEntry = true
		passwordField.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(passwordField)

		loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
		loginButton.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(loginButton)

		signUpView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(signUpView)

		forgotPasswordView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(forgotPasswordView)

		NSLayoutConstraint.activate([
			textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .offset),
			textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.offset),

			emailField.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 30),
			emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .offset),
			emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.offset),

			passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 10),
			passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .offset),
			passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.offset),

			loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 30),
			loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .offset),
			loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.offset),

			signUpView.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 26),
			signUpView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .offset),
			signUpView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.offset),

			forgotPasswordView.topAnchor.constraint(equalTo: signUpView.bottomAnchor, constant: 7),
			forgotPasswordView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .offset),
			forgotPasswordView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.offset),
			forgotPasswordView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -54)
		])
	}

	@objc private func loginAction() {
	}

	@objc func authTextAction(_ button: Button) {

		switch button.tag {
		case 1:
			break
		case 2:
			break
		default:
			assertionFailure()
		}
	}
}
