//
//  FavoriteCell.swift
//  nors-dark
//
//  Created by Neo Mode on 18.02.2022.
//

import UIKit

struct Favorite: CellID {
	let id: Int
	let image: URL
	let price: UInt32
	let detail: DetailInfo
	let cellID = "FavoriteCell"
}

final class FavoriteCell: UITableViewCell, ViewCellID {

	private let favImageView = FavoriteImageView()
	private let priceLabel = UILabel()
	private let detailInfoView = DetailInfoView(style: .search)
	private let formatter = NumberFormatter()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		backgroundColor = .clear
		selectionStyle = .none

		formatter.locale = Locale(identifier: "en_US")
		formatter.numberStyle = .currency
		formatter.maximumFractionDigits = 0

		favImageView.clipsToBounds = true
		favImageView.layer.cornerRadius = 10
		favImageView.contentMode = .scaleAspectFill
		favImageView.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(favImageView)

		priceLabel.font = .bold(size: 22)
		priceLabel.textColor = .white
		priceLabel.translatesAutoresizingMaskIntoConstraints = false
		favImageView.addSubview(priceLabel)

		detailInfoView.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(detailInfoView)

		NSLayoutConstraint.activate([
			favImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
			favImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .offset),
			favImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.offset),
			favImageView.heightAnchor.constraint(equalToConstant: 200),

			priceLabel.leadingAnchor.constraint(equalTo: favImageView.leadingAnchor, constant: 10),
			priceLabel.trailingAnchor.constraint(equalTo: favImageView.trailingAnchor, constant: -10),
			priceLabel.bottomAnchor.constraint(equalTo: favImageView.bottomAnchor, constant: -14),

			detailInfoView.topAnchor.constraint(equalTo: favImageView.bottomAnchor),
			detailInfoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			detailInfoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			detailInfoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
		])
	}

	required init?(coder: NSCoder) { nil }

	func set(model: CellID) {
		guard let model = model as? Favorite else { return assertionFailure() }
		favImageView.tag = model.id
		favImageView.image = UIImage(contentsOfFile: model.image.path)
		priceLabel.text = formatter.string(from: model.price as NSNumber)
		detailInfoView.model = model.detail
	}
}
