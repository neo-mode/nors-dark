//
//  TableViewDataSource.swift
//  nors-dark
//
//  Created by Neo Mode on 09.02.2022.
//

import UIKit

protocol CellID {
	var cellID: String { get }
}

protocol ViewCellID {
	func set(model: CellID)
}

final class TableViewDataSource: NSObject, UITableViewDataSource {

	var models: [CellID]

	init(models: [CellID] = []) {
		self.models = models
		super.init()
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return models.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let model = models[indexPath.row]
		let cell = tableView.dequeueReusableCell(withIdentifier: model.cellID, for: indexPath)
		guard let view = cell as? ViewCellID else { assertionFailure(); return cell }
		view.set(model: model)
		return cell
	}
}
