//
//  DetailInfoView.swift
//  nors-dark
//
//  Created by Neo Mode on 11.02.2022.
//

import UIKit

struct DetailInfo {
	let price: UInt32
	let square: UInt16
	let rooms: UInt8
	let district: String
}

enum DetailInfoViewStyle {
	case search, detail
}

final class DetailInfoView: UIView {

	var model: DetailInfo { didSet { set(model: model) } }

	private let formatter = NumberFormatter()
	private let priceLabel = UILabel()
	private let squareView: TitleDescrView
	private let roomsView: TitleDescrView
	private let districtView: TitleDescrView

	init(model: DetailInfo, style: DetailInfoViewStyle) {
		self.model = model
		squareView = TitleDescrView(style: style, title: "m2")
		roomsView = TitleDescrView(style: style, title: "Number of Rooms")
		districtView = TitleDescrView(style: style, title: "District")
		super.init(frame: .zero)

		formatter.locale = Locale(identifier: "en_US")
		formatter.numberStyle = .currency
		formatter.maximumFractionDigits = 0

		set(model: model)

		priceLabel.font = .SF_bold(size: 22)
		priceLabel.translatesAutoresizingMaskIntoConstraints = false

		squareView.translatesAutoresizingMaskIntoConstraints = false
		roomsView.translatesAutoresizingMaskIntoConstraints = false
		districtView.translatesAutoresizingMaskIntoConstraints = false

		addSubview(priceLabel)
		addSubview(squareView)
		addSubview(roomsView)
		addSubview(districtView)

		let insets: UIEdgeInsets
		let priceOffset, topOffset: CGFloat

		switch style {
		case .search:
			priceLabel.textColor = Color.white
			insets = UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20)
			priceOffset = 32
			topOffset = 5

		case .detail:
			priceLabel.textColor = .white
			insets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
			priceOffset = 10
			topOffset = 7
		}

		NSLayoutConstraint.activate([
			priceLabel.topAnchor.constraint(equalTo: topAnchor, constant: insets.top),
			priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insets.left),
			priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -insets.right),

			squareView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: priceOffset),
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
		priceLabel.text = formatter.string(from: model.price as NSNumber)
		squareView.descr = "\(model.square)"
		roomsView.descr = "\(model.rooms)"
		districtView.descr = model.district
	}
}
