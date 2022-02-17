//
//  SignUpViewController.swift
//  nors-dark
//
//  Created by Neo Mode on 07.02.2022.
//

import UIKit

final class SignUpViewController: UIViewController {

	private let emailField = TextField()
	private let passwordField = TextField()
	private let confirmPasswordField = TextField()
	private let signUpButton = Button(style: .blue, title: "Sign Up")
	private let authTextView = AuthTextView(text: "already member?", buttonText: "Login")

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = Color.black

		emailField.placeholder = "E-mail"
		emailField.keyboardType = .emailAddress
		emailField.translatesAutoresizingMaskIntoConstraints = false

		passwordField.placeholder = "Password"
		passwordField.isSecureTextEntry = true
		passwordField.translatesAutoresizingMaskIntoConstraints = false

		confirmPasswordField.placeholder = "Confirm Password"
		confirmPasswordField.translatesAutoresizingMaskIntoConstraints = false

		signUpButton.translatesAutoresizingMaskIntoConstraints = false
		authTextView.translatesAutoresizingMaskIntoConstraints = false

		view.addSubview(emailField)
		view.addSubview(passwordField)
		view.addSubview(confirmPasswordField)
		view.addSubview(signUpButton)
		view.addSubview(authTextView)

		NSLayoutConstraint.activate([
			emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .offset),
			emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.offset),

			passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 10),
			passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .offset),
			passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.offset),

			confirmPasswordField.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 10),
			confirmPasswordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .offset),
			confirmPasswordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.offset),

			signUpButton.topAnchor.constraint(equalTo: confirmPasswordField.bottomAnchor, constant: 30),
			signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .offset),
			signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.offset),

			authTextView.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 26),
			authTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .offset),
			authTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.offset),
			authTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -81)
		])
	}

	@objc func authTextAction() {
		print("Kek")
	}
}
