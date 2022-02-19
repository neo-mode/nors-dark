//
//  DetailInfoView.swift
//  nors-dark
//
//  Created by Neo Mode on 11.02.2022.
//

import UIKit

struct DetailInfo {
	let square: UInt16
	let rooms: UInt8
	let district: String
}

enum DetailInfoViewStyle {
	case search, detail
}

final class DetailInfoView: UIView {

	var model: DetailInfo { didSet { set(model: model) } }

	private let squareView: TitleDescrView
	private let roomsView: TitleDescrView
	private let districtView: TitleDescrView

	init(style: DetailInfoViewStyle, model: DetailInfo = DetailInfo(square: 0, rooms: 0, district: "")) {
		self.model = model
		squareView = TitleDescrView(style: style, title: "m2")
		roomsView = TitleDescrView(style: style, title: "Number of Rooms")
		districtView = TitleDescrView(style: style, title: "District")
		super.init(frame: .zero)

		set(model: model)

		squareView.translatesAutoresizingMaskIntoConstraints = false
		roomsView.translatesAutoresizingMaskIntoConstraints = false
		districtView.translatesAutoresizingMaskIntoConstraints = false

		addSubview(squareView)
		addSubview(roomsView)
		addSubview(districtView)

		let insets: UIEdgeInsets
		let topOffset: CGFloat

		switch style {
		case .search:
			insets = UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20)
			topOffset = 7

		case .detail:
			insets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
			topOffset = 7
		}

		NSLayoutConstraint.activate([
			squareView.topAnchor.constraint(equalTo: topAnchor, constant: insets.top),
			squareView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insets.left),
			squareView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -insets.right),

			roomsView.topAnchor.constraint(equalTo: squareView.bottomAnchor, constant: topOffset),
			roomsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insets.left),
			roomsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -insets.right),

			districtView.topAnchor.constraint(equalTo: roomsView.bottomAnchor, constant: topOffset),
			districtView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insets.left),
			districtView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -insets.right),
			districtView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -insets.bottom)
		])
	}
	
	required init?(coder: NSCoder) { nil }

	private func set(model: DetailInfo) {
		squareView.descr = "\(model.square)"
		roomsView.descr = "\(model.rooms)"
		districtView.descr = model.district
	}
}
