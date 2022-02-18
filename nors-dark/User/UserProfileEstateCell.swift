//
//  UserProfileEstateCell.swift
//  nors-dark
//
//  Created by Neo Mode on 17.02.2022.
//

import UIKit

struct UserProfileEstate: CellID {
	let image: URL
	let price: UInt32
	let bedNum: UInt8
	let bathNum: UInt8
	let cellID = "UserProfileEstateCell"
}

final class UserProfileEstateCell: UICollectionViewCell, ViewCellID {

	private let imageView = UIImageView()
	private let priceLabel = UILabel()
	private let descrLabel = UILabel()
	private let formatter = NumberFormatter()

	override init(frame: CGRect) {
		super.init(frame: frame)

		formatter.locale = Locale(identifier: "en_US")
		formatter.numberStyle = .currency
		formatter.maximumFractionDigits = 0

		imageView.clipsToBounds = true
		imageView.layer.cornerRadius = 15
		imageView.contentMode = .scaleAspectFill
		imageView.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(imageView)

		priceLabel.backgroundColor = Color.darkBlue
		priceLabel.textColor = Color.lightGray
		priceLabel.font = .semibold(size: 12)
		priceLabel.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(priceLabel)

		descrLabel.backgroundColor = Color.darkBlue
		descrLabel.font = .medium(size: 10)
		descrLabel.textColor = Color.blue
		descrLabel.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(descrLabel)

		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
			imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			imageView.heightAnchor.constraint(equalToConstant: 93),

			priceLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
			priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

			descrLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 3),
			descrLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			descrLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			descrLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
		])
	}

	required init?(coder: NSCoder) { nil }

	func set(model: CellID) {
		let model = model as! UserProfileEstate
		imageView.image = UIImage(contentsOfFile: model.image.path)
		priceLabel.text = formatter.string(from: model.price as NSNumber)
		descrLabel.text = "\(model.bedNum) bed \(model.bathNum) bath"
	}
}
