//
//  UserHeaderView.swift
//  nors-dark
//
//  Created by Neo Mode on 17.02.2022.
//

import UIKit

enum SocialName: String {
	case twitter, instagram, facebook
}

struct Social {
	let name: SocialName
	let url: URL
}

struct UserHeader {
	let image: URL
	let name: String
	let city: String
	let social: [Social]
}

final class UserHeaderView: UIView {

	var model: UserHeader? {
		didSet {
			guard let model = model else { return }
			imageView.image = UIImage(contentsOfFile: Bundle.main.url(forResource: "villa1", withExtension: "jpg")!.path)
			nameLabel.text = model.name
			cityLabel.text = model.city
		}
	}

	private let imageView = UIImageView()
	private let nameLabel = UILabel()
	private let cityLabel = UILabel()
	private let socialsView = UIStackView()

	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = Color.black

		layer.cornerRadius = 35
		layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]

		imageView.clipsToBounds = true
		imageView.layer.cornerRadius = 27
		imageView.translatesAutoresizingMaskIntoConstraints = false
		addSubview(imageView)

		nameLabel.backgroundColor = Color.black
		nameLabel.font = .medium(size: 14)
		nameLabel.textColor = Color.white
		nameLabel.translatesAutoresizingMaskIntoConstraints = false
		addSubview(nameLabel)

		cityLabel.backgroundColor = Color.black
		cityLabel.font = .regular(size: 14)
		cityLabel.textColor = Color.middleGray
		cityLabel.translatesAutoresizingMaskIntoConstraints = false
		addSubview(cityLabel)

		socialsView.backgroundColor = Color.black
		socialsView.axis = .horizontal
		socialsView.translatesAutoresizingMaskIntoConstraints = false
		addSubview(socialsView)

		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
			imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .offset),
			imageView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -.offset),
			imageView.widthAnchor.constraint(equalToConstant: 90),
			imageView.heightAnchor.constraint(equalToConstant: 90),

			nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 29),
			nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20),
			nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.offset),

			cityLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
			cityLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20),
			cityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.offset),

			socialsView.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 14),
			socialsView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20),
			socialsView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -.offset),
			socialsView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor)
		])
	}

	required init?(coder: NSCoder) { nil }
}
