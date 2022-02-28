//
//  TitleDescrView.swift
//  nors-dark
//
//  Created by Neo Mode on 09.02.2022.
//

import UIKit

struct TitleDescr {
	let title: String
	let descr: String
}

final class TitleDescrView: UIView {

	var title: String { didSet { titleLabel.text = title } }
	var descr: String? { didSet { descrLabel.text = descr } }

	private let titleLabel = UILabel()
	private let descrLabel = UILabel()

	init(style: DetailInfoViewStyle, title: String, descr: String? = nil) {
		self.title = title
		self.descr = descr
		super.init(frame: .zero)

		titleLabel.backgroundColor = Color.black
		titleLabel.text = title
		titleLabel.font = .medium(size: 12)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false

		descrLabel.backgroundColor = Color.black
		descrLabel.text = descr
		descrLabel.font = .regular(size: 12)
		descrLabel.textColor = Color.lightGray
		descrLabel.translatesAutoresizingMaskIntoConstraints = false

		switch style {
		case .search:
			titleLabel.textColor = Color.middleGray

		case .detail:
			titleLabel.textColor = Color.darkGray
		}

		addSubview(titleLabel)
		addSubview(descrLabel)

		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: topAnchor),
			titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
			titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),

			descrLabel.topAnchor.constraint(equalTo: topAnchor),
			descrLabel.leadingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor),
			descrLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
			descrLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}

	required init?(coder: NSCoder) { nil }
}
