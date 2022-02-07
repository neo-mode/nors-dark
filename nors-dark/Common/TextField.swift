//
//  TextField.swift
//  nors-dark
//
//  Created by Neo Mode on 07.02.2022.
//

import UIKit

final class TextField: UITextField {

	static let padding = UIEdgeInsets(top: 11, left: 19, bottom: 12, right: 19)

	override var placeholder: String? {
		didSet {
			guard let placeholder = placeholder else { return }
			attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [
				.font: UIFont.SF_regular(size: 14), .foregroundColor: Colors.lightGray
			])
		}
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = Colors.darkBlue
		layer.cornerRadius = 10
		font = .SF_regular(size: 14)
		textColor = .white
	}

	required init?(coder: NSCoder) { nil }

	override func textRect(forBounds bounds: CGRect) -> CGRect {
		return super.textRect(forBounds: bounds).inset(by: Self.padding)
	}

	override func editingRect(forBounds bounds: CGRect) -> CGRect {
		return super.editingRect(forBounds: bounds).inset(by: Self.padding)
	}
}
