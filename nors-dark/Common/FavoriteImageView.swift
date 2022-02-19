//
//  FavoriteImageView.swift
//  nors-dark
//
//  Created by Neo Mode on 09.02.2022.
//

import UIKit

final class FavoriteImageView: UIView {

	override var tag: Int { didSet { circleView.tag = tag } }
	var isActived = false { didSet { circleImageView.image = .image(name: isActived ? .heartOn : .heartOff) } }
	var image: UIImage? { didSet { imageView.image = image } }

	private let circleView = UIControl()
	private let circleImageView = UIImageView(image: .image(name: .heartOff))
	private let imageView = UIImageView()

	override init(frame: CGRect) {
		super.init(frame: frame)

		imageView.contentMode = .scaleAspectFill
		imageView.translatesAutoresizingMaskIntoConstraints = false
		addSubview(imageView)

		circleView.addTarget(nil, action: Selector(("favoriteImageViewAction:")), for: .touchUpInside)
		circleView.layer.cornerRadius = 15
		circleView.backgroundColor = Color.middleGray2.withAlphaComponent(0.1)
		circleView.translatesAutoresizingMaskIntoConstraints = false
		addSubview(circleView)

		circleImageView.translatesAutoresizingMaskIntoConstraints = false
		circleView.addSubview(circleImageView)

		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: topAnchor),
			imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
			imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
			imageView.bottomAnchor.constraint(equalTo: bottomAnchor),

			circleView.topAnchor.constraint(equalTo: topAnchor, constant: 9),
			circleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11),
			circleView.widthAnchor.constraint(equalToConstant: 30),
			circleView.heightAnchor.constraint(equalToConstant: 30),

			circleImageView.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
			circleImageView.centerYAnchor.constraint(equalTo: circleView.centerYAnchor)
		])
	}

	required init?(coder: NSCoder) { nil }
}
