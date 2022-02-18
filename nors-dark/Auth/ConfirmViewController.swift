//
//  ConfirmViewController.swift
//  nors-dark
//
//  Created by Neo Mode on 07.02.2022.
//

import UIKit

final class ConfirmViewController: UIViewController {

	private let textLabel = UILabel()
	private let textField = TextField()
	private let confirmButton = Button(style: .blue, title: "Confirm")
	private let authTextView = AuthTextView(text: "Do not get it?", buttonText: "Resend code")

	private let textFieldDelegate = TextFieldDelegate()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = Color.black

		textLabel.font = .regular(size: 14)
		textLabel.textColor = Color.darkGray
		textLabel.text = "Please enter the verification code from the sms we just send you."
		textLabel.numberOfLines = 0
		textLabel.translatesAutoresizingMaskIntoConstraints = false

		textField.delegate = textFieldDelegate
		textField.placeholder = "Code"
		textField.keyboardType = .numberPad
		textField.translatesAutoresizingMaskIntoConstraints = false

		confirmButton.translatesAutoresizingMaskIntoConstraints = false
		authTextView.translatesAutoresizingMaskIntoConstraints = false

		view.addSubview(textLabel)
		view.addSubview(textField)
		view.addSubview(confirmButton)
		view.addSubview(authTextView)

		textFieldDelegate.view = view

		NSLayoutConstraint.activate([
			textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .offset),
			textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.offset),

			textField.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 20),
			textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .offset),
			textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.offset),

			confirmButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 30),
			confirmButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .offset),
			confirmButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.offset),

			authTextView.topAnchor.constraint(equalTo: confirmButton.bottomAnchor, constant: 15),
			authTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .offset),
			authTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.offset),
			authTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -81),
		])
	}

	@objc func authTextAction() {
		print("Kek")
	}
}
