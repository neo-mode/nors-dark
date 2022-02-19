//
//  FavoritesViewController.swift
//  nors-dark
//
//  Created by Neo Mode on 18.02.2022.
//

import UIKit

final class FavoritesViewController: UIViewController {

	private let tableView = UITableView()
	private let dataSource = TableDataSource()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = Color.black

		for i in 1...10 {
			dataSource.models.append(Favorite(
				id: i, image: Bundle.main.url(forResource: "villa\((i % 10) + 1)", withExtension: "jpg")!,
				price: 1050000, detail: DetailInfo(square: 240, rooms: 4, district: "Toronto")
			))
		}

		tableView.backgroundColor = .clear
		tableView.separatorStyle = .none
		tableView.dataSource = dataSource
		tableView.register(FavoriteCell.self, forCellReuseIdentifier: "FavoriteCell")
		tableView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(tableView)

		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}

	@objc func favoriteImageViewAction(_ view: UIView) {
		print(view.tag)
	}
}
