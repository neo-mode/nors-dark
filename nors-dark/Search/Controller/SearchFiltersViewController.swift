//
//  SearchFiltersViewController.swift
//  nors-dark
//
//  Created by Neo Mode on 20.02.2022.
//

import UIKit

protocol SearchFiltersProtocol {
	var lineLayer: CAShapeLayer? { get set }
}

final class SearchFiltersViewController: UIViewController, StepperViewDelegate {

	private let headerView = SearchHeaderView()
	private let tableView = UITableView()
	private let dataSource = TableDataSource()

	private var property: [CellID] = []
	private var rooms: [CellID] = [
		SearchRooms(title: "Rooms", num: 1, min: 1, max: 5),
		SearchRooms(title: "Baths", num: 1, min: 1, max: 5)
	]

	private lazy var headerTop = headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
	private var headerHeight: CGFloat = 0
	private var scrollPos: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = Color.darkBlue

		for i in 0..<50 {
			property.append(SearchProperty(id: i, title: "title_\(i)", isActived: false))
		}

		tableView.backgroundColor = .clear
		tableView.separatorStyle = .none
		tableView.dataSource = dataSource
		tableView.delegate = self
		tableView.register(SearchPropertyCell.self, forCellReuseIdentifier: "SearchPropertyCell")
		tableView.register(SearchRoomsCell.self, forCellReuseIdentifier: "SearchRoomsCell")
		tableView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(tableView)

		headerView.delegate = self
		headerView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(headerView)

		NSLayoutConstraint.activate([
			headerTop,
			headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

			tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}

	@objc func searchPropertyAction(_ button: Button) {

		guard var model = dataSource.models[button.tag] as? SearchProperty else { return assertionFailure() }
		model.isActived.toggle()
		dataSource.models[button.tag] = model

		if model.isActived {
			button.style = .borderBlue
			button.title = "Remove"
		} else {
			button.style = .borderGray
			button.title = "Add"
		}
	}

	func stepperViewAction(_ view: StepperView) {
		print(view.value)
	}

	static func drawLine(rect: CGRect) -> CAShapeLayer {

		let path = UIBezierPath()
		path.move(to: CGPoint(x: rect.minX + 30, y: rect.minY))
		path.addLine(to: CGPoint(x: rect.maxX + 30, y: rect.minY))

		let lineLayer = CAShapeLayer()
		lineLayer.path = path.cgPath
		lineLayer.strokeColor = Color.black.cgColor
		lineLayer.lineWidth = 1
		return lineLayer
	}
}

extension SearchFiltersViewController: SearchHeaderViewDelegate {

	func searchHeaderViewProperty(_ view: SearchHeaderView) {
		dataSource.models = property
		tableView.reloadData()
	}

	func searchHeaderViewRooms(_ view: SearchHeaderView) {
		dataSource.models = rooms
		tableView.reloadData()
	}
}

extension SearchFiltersViewController: UITableViewDelegate {

	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

		guard var filter = cell as? SearchFiltersProtocol else { return assertionFailure() }
		if indexPath.row == 0 { filter.lineLayer?.removeFromSuperlayer(); return }
		if filter.lineLayer != nil { return }

		let rect = cell.bounds
		let path = UIBezierPath()
		path.move(to: CGPoint(x: rect.minX + 30, y: rect.minY))
		path.addLine(to: CGPoint(x: rect.maxX - 30, y: rect.minY))

		let lineLayer = CAShapeLayer()
		filter.lineLayer = lineLayer
		lineLayer.path = path.cgPath
		lineLayer.strokeColor = Color.black.cgColor
		lineLayer.lineWidth = 1
		cell.layer.addSublayer(lineLayer)
	}

	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let view = UIView()
		view.backgroundColor = .clear
		return view
	}

	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		headerHeight = headerView.bounds.height - 22
		return headerHeight
	}

	func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
	}

	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		headerTop.constant = -scrollView.contentOffset.y
	}
}
