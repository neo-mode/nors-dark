//
//  SearchViewController.swift
//  nors-dark
//
//  Created by Neo Mode on 09.02.2022.
//

import UIKit

final class SearchViewController: UIViewController {

	private let dataSource = TableViewDataSource()
	private let tableView = UITableView()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = Color.black

		for i in 0..<20 {

			let name = "villa\((i % 10) + 1)"
			guard let url = Bundle.main.url(forResource: name, withExtension: "jpg") else {
				return assertionFailure(name)
			}

			dataSource.models.append(
				SearchItem(id: i, image: url, price: 1400000, square: 120, rooms: 4, district: "Toronto")
			)
		}

		tableView.backgroundColor = .clear
		tableView.separatorStyle = .none
		tableView.register(SearchItemCell.self, forCellReuseIdentifier: "SearchItemCell")
		tableView.delegate = self
		tableView.dataSource = dataSource
		tableView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(tableView)

		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}

	@objc func favoriteImageViewAction(_ view: UIControl) {
		print(view.tag)
	}
}

extension SearchViewController: UITableViewDelegate {

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
	}
}
