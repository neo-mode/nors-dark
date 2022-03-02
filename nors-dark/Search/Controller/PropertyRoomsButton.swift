//
//  PropertyRoomsButton.swift
//  nors-dark
//
//  Created by Neo Mode on 20.02.2022.
//

import UIKit

final class PropertyRoomsButton: UIControl {

	var title: String? { didSet { titleLabel.text = title } }
	var descr: String? { didSet { descrLabel.text = descr } }

	private let titleLabel = UILabel()
	private let descrLabel = UILabel()

	override init(frame: CGRect) {
		super.init(frame: frame)

		titleLabel.font = .medium(size: 10)
		titleLabel.textColor = Color.lightGray
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		addSubview(titleLabel)

		descrLabel.font = .bold(size: 14)
		descrLabel.textColor = Color.white
		descrLabel.translatesAutoresizingMaskIntoConstraints = false
		addSubview(descrLabel)

		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
			titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

			descrLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
			descrLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			descrLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
			descrLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
		])
	}

	required init?(coder: NSCoder) { nil }
}
