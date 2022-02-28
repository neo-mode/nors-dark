//
//  SearchPropertyCell.swift
//  nors-dark
//
//  Created by Neo Mode on 26.02.2022.
//

import UIKit

struct SearchProperty: CellID {
	let id: Int
	let title: String
	var isActived: Bool
	let cellID = "SearchPropertyCell"
}

final class SearchPropertyCell: UITableViewCell, ViewCellID {

	private let titleLabel = UILabel()
	private let button = Button(style: .black)

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		backgroundColor = .clear
		selectionStyle = .none

		titleLabel.font = .semibold(size: 12)
		titleLabel.textColor = Color.lightGray
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(titleLabel)

		button.addTarget(nil, action: Selector(("searchPropertyAction:")), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(button)

		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18),
			titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35),
			titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -18),

			button.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor),
			button.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
			button.leadingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor, constant: 10),
			button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
			button.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor)
		])
	}

	required init?(coder: NSCoder) { nil }

	func set(model: CellID) {

		guard let model = model as? SearchProperty else { return assertionFailure() }
		titleLabel.text = model.title
		button.tag = model.id

		if model.isActived {
			button.style = .borderBlue
			button.title = "Remove"
		} else {
			button.style = .borderGray
			button.title = "Add"
		}
	}
}
