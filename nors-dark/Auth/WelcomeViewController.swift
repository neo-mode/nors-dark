//
//  WelcomeViewController.swift
//  nors-dark
//
//  Created by Neo Mode on 06.02..offset22.
//

import UIKit

final class WelcomeViewController: UIViewController {

	private let titleLabel = UILabel()
	private let signInButton = Button(style: .blue, title: "Sign Up With Email")
	private let facebookButton = Button(style: .black, title: "Continue with facebook")

	override func loadView() {
		let imageView = UIImageView(image: .image(name: .splash))
		view = imageView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = Colors.black

		titleLabel.text = "Sed ut perspiciatis unde omnis iste natus error sit."
		titleLabel.textColor = Colors.middleGray
		titleLabel.translatesAutoresizingMaskIntoConstraints = false

		signInButton.translatesAutoresizingMaskIntoConstraints = false
		facebookButton.translatesAutoresizingMaskIntoConstraints = false

		view.addSubview(titleLabel)
		view.addSubview(signInButton)
		view.addSubview(facebookButton)

		NSLayoutConstraint.activate([
			titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .offset),
			titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.offset),

			signInButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 84),
			signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .offset),
			signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.offset),

			facebookButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 21),
			facebookButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .offset),
			facebookButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.offset),
			facebookButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -41)
		])
	}
}
