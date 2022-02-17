//
//  PhotoCell.swift
//  nors-dark
//
//  Created by Neo Mode on 16.02.2022.
//

import UIKit

final class PhotoCell: UICollectionViewCell {

	private let imageView = UIImageView()

	override init(frame: CGRect) {
		super.init(frame: frame)

		clipsToBounds = true
		layer.cornerRadius = 13

		imageView.contentMode = .scaleAspectFill
		imageView.image = UIImage(contentsOfFile: Bundle.main.url(forResource: "villa1", withExtension: "jpg")!.path)
		imageView.translatesAutoresizingMaskIntoConstraints = false

		contentView.addSubview(imageView)

		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
			imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
			imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
			imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
		])
	}

	required init?(coder: NSCoder) { nil }
}
