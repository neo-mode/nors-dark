//
//  ForgotPasswordViewController.swift
//  nors-dark
//
//  Created by Neo Mode on 09.02.2022.
//

import UIKit

final class ForgotPasswordViewController: UIViewController {

	private let emailField = TextField()
	private let sendButton = Button(style: .blue, title: "Send")
	private let textFieldDelegate = TextFieldDelegate()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = Color.black
		textFieldDelegate.view = view

		emailField.delegate = textFieldDelegate
		emailField.keyboardType = .emailAddress
		emailField.placeholder = "Email"
		emailField.translatesAutoresizingMaskIntoConstraints = false

		sendButton.addTarget(self, action: #selector(sendAction), for: .touchUpInside)
		sendButton.translatesAutoresizingMaskIntoConstraints = false

		view.addSubview(emailField)
		view.addSubview(sendButton)

		NSLayoutConstraint.activate([
			emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .offset),
			emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.offset),

			sendButton.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 25),
			sendButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .offset),
			sendButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.offset),
			sendButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -132),
		])
	}

	@objc private func sendAction() {
	}
}
