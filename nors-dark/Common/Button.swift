//
//  Button.swift
//  nors-dark
//
//  Created by Neo Mode on 01.02.2022.
//

import UIKit

final class Button: UIButton {

	enum Style {
		case whiteBlue, whiteGray, black, blue
	}

	init(style: Style, title: String? = nil) {
		super.init(frame: .zero)
		layer.cornerRadius = 20
		contentEdgeInsets = UIEdgeInsets(top: 14, left: 0, bottom: 16, right: 0)
		titleLabel?.font = .SF_bold(size: 12)
		setTitle(title, for: .normal)

		switch style {
		case .whiteBlue:
			backgroundColor = .white
			setTitleColor(Colors.blue, for: .normal)

		case .whiteGray:
			layer.borderWidth = 1
			layer.borderColor = Colors.darkBlue.cgColor
			setTitleColor(Colors.darkGray, for: .normal)

		case .black:
			backgroundColor = Colors.black
			setTitleColor(Colors.white, for: .normal)

		case .blue:
			backgroundColor = Colors.blue
			setTitleColor(.white, for: .normal)
		}
	}

	required init?(coder: NSCoder) { nil }
}
