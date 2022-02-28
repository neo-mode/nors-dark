//
//  Button.swift
//  nors-dark
//
//  Created by Neo Mode on 01.02.2022.
//

import UIKit

final class Button: UIButton {

	var style: Style { didSet { setStyle() } }
	var title: String? { didSet { setTitle(title, for: .normal) } }

	enum Style {
		case whiteBlue, whiteGray, black, blue, borderBlue, borderGray
	}

	init(style: Style, title: String? = nil) {
		self.style = style
		super.init(frame: .zero)

		layer.cornerRadius = 20
		contentEdgeInsets = UIEdgeInsets(top: 17, left: 0, bottom: 18, right: 0)

		titleLabel?.font = .bold(size: 12)
		setTitle(title, for: .normal)
		setStyle()
	}

	required init?(coder: NSCoder) { nil }

	private func setStyle() {

		switch style {
		case .whiteBlue:
			backgroundColor = .white
			setTitleColor(Color.blue, for: .normal)

		case .whiteGray:
			layer.borderWidth = 1
			layer.borderColor = Color.darkBlue.cgColor
			setTitleColor(Color.darkGray, for: .normal)

		case .black:
			backgroundColor = Color.black
			setTitleColor(Color.white, for: .normal)

		case .blue:
			backgroundColor = Color.blue
			setTitleColor(.white, for: .normal)

		case .borderBlue:
			layer.cornerRadius = 15
			contentEdgeInsets = UIEdgeInsets(top: 7, left: 25, bottom: 8, right: 25)
			backgroundColor = .clear
			setTitleColor(Color.blue, for: .normal)
			layer.borderWidth = 1
			layer.borderColor = Color.blue.cgColor

		case .borderGray:
			layer.cornerRadius = 15
			contentEdgeInsets = UIEdgeInsets(top: 7, left: 25, bottom: 8, right: 25)
			backgroundColor = .clear
			setTitleColor(Color.lightGray, for: .normal)
			layer.borderWidth = 1
			layer.borderColor = Color.darkGray.cgColor
		}
	}
}
