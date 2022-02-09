//
//  KeyboardNotification.swift
//  nors-dark
//
//  Created by Neo Mode on 07.02.2022.
//

import UIKit

protocol KeyboardNotificationDelegate: AnyObject {
	func keyboardNotificationShow(_ keyboardNotification: KeyboardNotification, rect: CGRect)
	func keyboardNotificationHide(_ keyboardNotification: KeyboardNotification)
}

final class KeyboardNotification {

	weak var delegate: KeyboardNotificationDelegate?
	private var isShown = false

	init() {
		NotificationCenter.default.addObserver(
			self, selector: #selector(keyboardShowAction),
			name: UIResponder.keyboardWillShowNotification, object: nil
		)
		NotificationCenter.default.addObserver(
			self, selector: #selector(keyboardHideAction),
			name: UIResponder.keyboardWillHideNotification, object: nil
		)
	}

	deinit {
		NotificationCenter.default.removeObserver(self)
	}

	@objc private func keyboardShowAction(_ notification: Notification) {

		if isShown { return }
		guard let rect = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
			return assertionFailure()
		}

		isShown = true
		delegate?.keyboardNotificationShow(self, rect: rect)
	}

	@objc private func keyboardHideAction() {
		isShown = false
		delegate?.keyboardNotificationHide(self)
	}
}
