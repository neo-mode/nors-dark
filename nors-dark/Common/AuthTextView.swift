//
//  AuthTextView.swift
//  nors-dark
//
//  Created by Neo Mode on 07.02.2022.
//

import UIKit

final class AuthTextView: UIView {

	private let textLabel = UILabel()
	private let button = UIButton()

	init(text: String, buttonText: String, tag: Int = 0) {
		super.init(frame: .zero)

		textLabel.font = .regular(size: 12)
		textLabel.textColor = Color.white
		textLabel.text = text
		textLabel.translatesAutoresizingMaskIntoConstraints = false

		button.tag = tag
		button.setTitle(buttonText, for: .normal)
		button.setTitleColor(.white, for: .normal)
		button.titleLabel?.font = .bold(size: 12)
		button.addTarget(nil, action: Selector(("authTextAction:")), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false

		addSubview(textLabel)
		addSubview(button)

		NSLayoutConstraint.activate([
			textLabel.topAnchor.constraint(equalTo: topAnchor),
			textLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
			textLabel.bottomAnchor.constraint(equalTo: bottomAnchor),

			button.topAnchor.constraint(equalTo: topAnchor),
			button.leadingAnchor.constraint(equalTo: textLabel.trailingAnchor, constant: 10),
			button.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
			button.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}

	required init?(coder: NSCoder) { nil }
}
