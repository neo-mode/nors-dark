//
//  StepperView.swift
//  nors-dark
//
//  Created by Neo Mode on 27.02.2022.
//

import UIKit

protocol StepperViewDelegate: AnyObject {
	func stepperViewIncr(_ view: StepperView, value: Int)
	func stepperViewDecr(_ view: StepperView, value: Int)
}

final class StepperView: UIView {

	weak var delegate: StepperViewDelegate?

	var minValue: Int? { didSet {
		guard let val = minValue else { return }
		if value < val { value = val }
	}}

	var maxValue: Int? { didSet {
		guard let val = maxValue else { return }
		if value > val { value = val }
	}}

	var value: Int = 0 { didSet { textLabel.text = "\(value)" } }

	private var minReached = false
	private var maxReached = false

	private let minusButton = UIButton()
	private let plusButton = UIButton()
	private let textLabel = UILabel()

	override init(frame: CGRect) {
		super.init(frame: frame)

		minusButton.setImage(.image(name: .minusCircle), for: .normal)
		minusButton.setImage(.image(name: .minusCircle), for: .highlighted)
		minusButton.addTarget(self, action: #selector(minusAction), for: .touchUpInside)
		minusButton.translatesAutoresizingMaskIntoConstraints = false
		addSubview(minusButton)

		plusButton.setImage(.image(name: .plusCircle), for: .normal)
		plusButton.setImage(.image(name: .plusCircle), for: .highlighted)
		plusButton.addTarget(self, action: #selector(plusAction), for: .touchUpInside)
		plusButton.translatesAutoresizingMaskIntoConstraints = false
		addSubview(plusButton)

		textLabel.text = "0"
		textLabel.font = .regular(size: 14)
		textLabel.textColor = Color.lightGray
		textLabel.textAlignment = .center
		textLabel.translatesAutoresizingMaskIntoConstraints = false
		addSubview(textLabel)

		NSLayoutConstraint.activate([
			minusButton.topAnchor.constraint(equalTo: topAnchor),
			minusButton.leadingAnchor.constraint(equalTo: leadingAnchor),
			minusButton.bottomAnchor.constraint(equalTo: bottomAnchor),

			textLabel.topAnchor.constraint(equalTo: topAnchor),
			textLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor),
			textLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 50),
			textLabel.bottomAnchor.constraint(equalTo: bottomAnchor),

			plusButton.topAnchor.constraint(equalTo: topAnchor),
			plusButton.leadingAnchor.constraint(equalTo: textLabel.trailingAnchor),
			plusButton.trailingAnchor.constraint(equalTo: trailingAnchor),
			plusButton.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}

	required init?(coder: NSCoder) { nil }

	@objc private func minusAction() {

		let val = value - 1
		if let target = minValue {
			if value == target { return }
			if val == target { minReached = true }
		}

		value = val
		textLabel.text = "\(val)"

		if minReached {
			minusButton.imageView?.tintColor = Color.lightWhite
		}

		if maxReached {
			plusButton.imageView?.tintColor = Color.blue
			maxReached = false
		}

		delegate?.stepperViewDecr(self, value: val)
	}

	@objc private func plusAction() {

		let val = value + 1
		if let target = maxValue {
			if value == target { return }
			if val == target { maxReached = true }
		}

		value = val
		textLabel.text = "\(val)"

		if minReached {
			minusButton.imageView?.tintColor = Color.blue
			minReached = false
		}

		if maxReached {
			plusButton.imageView?.tintColor = Color.lightWhite
		}

		delegate?.stepperViewIncr(self, value: val)
	}
}
