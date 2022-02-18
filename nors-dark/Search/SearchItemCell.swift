//
//  SearchItemCell.swift
//  nors-dark
//
//  Created by Neo Mode on 09.02.2022.
//

import UIKit

struct SearchItem: CellID {
	let id: Int
	let image: URL
	let price: Decimal
	let square: UInt16
	let rooms: UInt8
	let district: String
	let cellID = "SearchItemCell"
}

final class SearchItemCell: UITableViewCell, ViewCellID {

	private let formatter = NumberFormatter()
	private let cellImageView = FavoriteImageView()
	private let priceLabel = UILabel()
	private let squareView = TitleDescrView(style: .search, title: "m2")
	private let roomsView = TitleDescrView(style: .search, title: "Number of Rooms")
	private let districtView = TitleDescrView(style: .search, title: "District")

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		selectionStyle = .none
		backgroundColor = .clear

		formatter.locale = Locale(identifier: "en_US")
		formatter.numberStyle = .currency
		formatter.maximumFractionDigits = 0

		cellImageView.contentMode = .scaleAspectFit
		cellImageView.layer.cornerRadius = 15
		cellImageView.clipsToBounds = true
		cellImageView.translatesAutoresizingMaskIntoConstraints = false

		priceLabel.font = .bold(size: 22)
		priceLabel.textColor = Color.white
		priceLabel.translatesAutoresizingMaskIntoConstraints = false

		squareView.translatesAutoresizingMaskIntoConstraints = false
		roomsView.translatesAutoresizingMaskIntoConstraints = false
		districtView.translatesAutoresizingMaskIntoConstraints = false

		contentView.addSubview(cellImageView)
		contentView.addSubview(priceLabel)
		contentView.addSubview(squareView)
		contentView.addSubview(roomsView)
		contentView.addSubview(districtView)

		NSLayoutConstraint.activate([
			cellImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
			cellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .offset),
			cellImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
			cellImageView.widthAnchor.constraint(equalToConstant: 161),
			cellImageView.heightAnchor.constraint(equalToConstant: 125),

			priceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
			priceLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 9),
			priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.offset),

			squareView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5),
			squareView.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 9),
			squareView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.offset),

			roomsView.topAnchor.constraint(equalTo: squareView.bottomAnchor, constant: 5),
			roomsView.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 9),
			roomsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.offset),

			districtView.topAnchor.constraint(equalTo: roomsView.bottomAnchor, constant: 5),
			districtView.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 9),
			districtView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.offset),
		])
	}

	required init?(coder: NSCoder) { nil }

	func set(model: CellID) {
		guard let model = model as? SearchItem else { return assertionFailure() }

		cellImageView.tag = model.id
		cellImageView.image = UIImage(contentsOfFile: model.image.path)

		priceLabel.text = formatter.string(from: model.price as NSNumber)
		squareView.descr = "\(model.square)"
		roomsView.descr = "\(model.rooms)"
		districtView.descr = model.district
	}
}
