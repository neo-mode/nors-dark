//
//  SliderView.swift
//  nors-dark
//
//  Created by Neo Mode on 03.09.2022.
//

import UIKit

final class SliderView: UIView {

	private let lineView = UIView()
	private let minCircleView = UIView()
	private let maxCircleView = UIView()
	private unowned var targetView: UIView!

	private var offsetX: CGFloat = 0
	private var minLimitX: CGFloat = 0
	private var maxLimitX: CGFloat = 0

	var minValue: CGFloat = 0
	var maxValue: CGFloat = 1

	override init(frame: CGRect) {
		super.init(frame: frame)

		let panMin = PanGestureRecognizer()
		panMin.addTarget(self, action: #selector(panAction(_:)))
		minCircleView.addGestureRecognizer(panMin)

		let panMax = PanGestureRecognizer()
		panMax.addTarget(self, action: #selector(panAction(_:)))
		maxCircleView.addGestureRecognizer(panMax)

		lineView.backgroundColor = Color.black
		lineView.translatesAutoresizingMaskIntoConstraints = false
		addSubview(lineView)

		minCircleView.frame = CGRect(x: 0, y: 0, width: 22, height: 22)
		minCircleView.backgroundColor = Color.white
		minCircleView.layer.cornerRadius = 11
		addSubview(minCircleView)

		maxCircleView.frame = CGRect(x: 0, y: 0, width: 22, height: 22)
		maxCircleView.backgroundColor = Color.white
		maxCircleView.layer.cornerRadius = 11
		addSubview(maxCircleView)

		NSLayoutConstraint.activate([
			heightAnchor.constraint(equalToConstant: 22),

			lineView.leadingAnchor.constraint(equalTo: leadingAnchor),
			lineView.trailingAnchor.constraint(equalTo: trailingAnchor),
			lineView.centerYAnchor.constraint(equalTo: centerYAnchor),
			lineView.heightAnchor.constraint(equalToConstant: 3)
		])
	}

	required init?(coder: NSCoder) { nil }

	override func layoutSubviews() {
		super.layoutSubviews()

		maxCircleView.frame.origin.x = frame.width - 22
	}

	@objc private func panAction(_ gr: PanGestureRecognizer) {

		switch gr.state {
		case .began:
			panBegan(x: gr.location(in: gr.view).x, view: gr.view)

		case .changed:
			panChanged(x: gr.location(in: window).x)

		default:
			break
		}
	}

	private func panBegan(x: CGFloat, view: UIView?) {

		offsetX = x + frame.minX
		if view == minCircleView {
			minLimitX = 0
			maxLimitX = maxCircleView.frame.minX
			targetView = minCircleView
		} else {
			minLimitX = minCircleView.frame.minX
			maxLimitX = frame.width - 22
			targetView = maxCircleView
		}
	}

	private func panChanged(x: CGFloat) {

		let targetX = x - offsetX
		if targetX < minLimitX { targetView.frame.origin.x = minLimitX; return }
		if targetX > maxLimitX { targetView.frame.origin.x = maxLimitX; return }

		targetView.frame.origin.x = targetX
	}
}

final class PanGestureRecognizer: UIPanGestureRecognizer {

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
		if state == .began { return }
		super.touchesBegan(touches, with: event)
		state = .began
	}
}
