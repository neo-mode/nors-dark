//
//  SearchRoomsCell.swift
//  nors-dark
//
//  Created by Neo Mode on 27.02.2022.
//

import UIKit

struct SearchRooms: CellID {
	let title: String
	var num: Int
	let min: Int?
	let max: Int?
	let cellID = "SearchRoomsCell"
}

final class SearchRoomsCell: UITableViewCell, ViewCellID {

	private let titleLabel = UILabel()
	private let stepperView = StepperView()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		backgroundColor = .clear
		selectionStyle = .none

		titleLabel.font = .semibold(size: 12)
		titleLabel.textColor = Color.lightGray
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(titleLabel)

		stepperView.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(stepperView)

		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 19),
			titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35),
			titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -19),

			stepperView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor),
			stepperView.leadingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor),
			stepperView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -35),
			stepperView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
			stepperView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor),
		])
	}

	required init?(coder: NSCoder) { nil }

	func set(model: CellID) {
		guard let model = model as? SearchRooms else { return assertionFailure() }
		titleLabel.text = model.title
		stepperView.minValue = model.min
		stepperView.maxValue = model.max
		stepperView.value = model.num
	}
}
