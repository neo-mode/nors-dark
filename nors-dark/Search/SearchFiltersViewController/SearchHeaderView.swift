//
//  SearchHeaderView.swift
//  nors-dark
//
//  Created by Neo Mode on 19.02.2022.
//

import UIKit

protocol SearchHeaderViewDelegate: AnyObject {
}

final class SearchHeaderView: UIView {

	weak var delegate: SearchHeaderViewDelegate?

	private let titleLabel = UILabel()
	private let searchField = TextField()

	private lazy var propertyWidth = propertyButton.widthAnchor.constraint(equalToConstant: 100)
	private let propertyButton = PropertyRoomsButton()
	private let roomsButton = PropertyRoomsButton()

	override init(frame: CGRect) {
		super.init(frame: frame)

		titleLabel.text = "Location"
		titleLabel.font = .medium(size: 10)
		titleLabel.textColor = Color.lightGray
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		addSubview(titleLabel)

		searchField.image = .search
		searchField.backgroundColor = Color.black
		searchField.translatesAutoresizingMaskIntoConstraints = false
		addSubview(searchField)

		propertyButton.title = "PROPERTY TYPE"
		propertyButton.descr = "Residental + Build…"
		propertyButton.addTarget(self, action: #selector(propertyAction), for: .touchUpInside)
		propertyButton.translatesAutoresizingMaskIntoConstraints = false
		addSubview(propertyButton)

		roomsButton.title = "ROOMS"
		roomsButton.descr = "4 + 1"
		roomsButton.addTarget(self, action: #selector(roomsAction), for: .touchUpInside)
		roomsButton.translatesAutoresizingMaskIntoConstraints = false
		addSubview(roomsButton)

		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: topAnchor),
			titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
			titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),

			searchField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 9),
			searchField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .offset),
			searchField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.offset),

			propertyButton.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: 12),
			propertyButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .offset),
			propertyButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
			propertyWidth,

			roomsButton.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: 12),
			roomsButton.leadingAnchor.constraint(equalTo: propertyButton.trailingAnchor),
			roomsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.offset),
			roomsButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
		])
	}

	required init?(coder: NSCoder) { nil }

	override func draw(_ rect: CGRect) {
		super.draw(rect)

		var width = (rect.maxX - .offset * 2) / 2
		propertyWidth.constant = width

		let frame = propertyButton.frame
		let length = rect.maxX - frame.minX

		var path = UIBezierPath()
		path.move(to: CGPoint(x: frame.minX, y: frame.minY))
		path.addLine(to: CGPoint(x: length, y: frame.minY))
		addLayer(path: path.cgPath)

		path = UIBezierPath()
		path.move(to: CGPoint(x: frame.minX, y: frame.maxY))
		path.addLine(to: CGPoint(x: length, y: frame.maxY))
		addLayer(path: path.cgPath)

		width += .offset
		path = UIBezierPath()
		path.move(to: CGPoint(x: width, y: frame.minY + 10))
		path.addLine(to: CGPoint(x: width, y: frame.maxY - 10))
		addLayer(path: path.cgPath)
	}

	private func addLayer(path: CGPath) {
		let lineLayer = CAShapeLayer()
		lineLayer.path = path
		lineLayer.strokeColor = Color.black.cgColor
		lineLayer.lineWidth = 1
		layer.addSublayer(lineLayer)
	}

	@objc private func propertyAction() {
		propertyButton.backgroundColor = Color.black
		roomsButton.backgroundColor = .clear
	}

	@objc private func roomsAction() {
		propertyButton.backgroundColor = .clear
		roomsButton.backgroundColor = Color.black
	}
}
