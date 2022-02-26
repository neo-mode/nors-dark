//
//  TextField.swift
//  nors-dark
//
//  Created by Neo Mode on 07.02.2022.
//

import UIKit

final class TextField: UITextField {

	private var padding = UIEdgeInsets(top: 11, left: 19, bottom: 12, right: 19)
	var image: Image = .none { didSet { updateImage() } }

	override var placeholder: String? {
		didSet {
			guard let placeholder = placeholder else { return }
			attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [
				.font: UIFont.regular(size: 14), .foregroundColor: Color.lightGray
			])
		}
	}

	enum Image {
		case search, none
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = Color.darkBlue
		layer.cornerRadius = 10
		font = .regular(size: 14)
		textColor = .white
	}

	required init?(coder: NSCoder) { nil }

	override func textRect(forBounds bounds: CGRect) -> CGRect {
		return super.textRect(forBounds: bounds).inset(by: padding)
	}

	override func editingRect(forBounds bounds: CGRect) -> CGRect {
		return super.editingRect(forBounds: bounds).inset(by: padding)
	}

	override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
		return super.leftViewRect(forBounds: bounds).inset(by: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: -15))
	}

	private func updateImage() {

		switch image {
		case .search:
			padding = UIEdgeInsets(top: 11, left: 10, bottom: 12, right: 19)
			leftViewMode = .always
			let imageView = UIImageView(image: .image(name: .search))
			imageView.tintColor = Color.lightGray
			leftView = imageView

		case .none:
			padding = UIEdgeInsets(top: 11, left: 19, bottom: 12, right: 19)
			leftViewMode = .never
			leftView = nil
		}
	}
}

final class TextFieldDelegate: NSObject, UITextFieldDelegate, KeyboardNotificationDelegate {

	private let notification = KeyboardNotification()
	private var topPoint: CGFloat = 0
	private weak var textField: UITextField?
	private lazy var tapGesture = UITapGestureRecognizer(target: self, action: #selector(resignAction))

	weak var view: UIView? {
		didSet {
			notification.delegate = view == nil ? nil : self
		}
	}

	func textFieldDidBeginEditing(_ textField: UITextField) {
		self.textField = textField
		topPoint = textField.frame.maxY + 15
	}

	func keyboardNotificationShow(_ keyboardNotification: KeyboardNotification, rect: CGRect) {

		guard let view = view else { return assertionFailure() }
		view.addGestureRecognizer(tapGesture)

		if rect.minY < topPoint {
			view.bounds.origin.y += topPoint - rect.minY
		}
	}

	func keyboardNotificationHide(_ keyboardNotification: KeyboardNotification) {
		guard let view = view else { return assertionFailure() }
		view.bounds.origin.y = 0
		view.removeGestureRecognizer(tapGesture)
	}

	@objc private func resignAction() {
		textField?.resignFirstResponder()
	}
}
