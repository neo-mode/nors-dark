//
//  UserProfileViewController.swift
//  nors-dark
//
//  Created by Neo Mode on 17.02.2022.
//

import UIKit

final class UserProfileViewController: UIViewController {

	private var models: [CellID] = []

	private let headerView = UserHeaderView()
	private let lastViewedLabel = UILabel()
	private let favoritedLabel = UILabel()

	private let layout: UICollectionViewFlowLayout
	private let lastViewedCollection: UICollectionView
	private let favoritedCollection: UICollectionView
	private let dataSource = CollectionDataSource()

	init() {
		layout = UICollectionViewFlowLayout()
		lastViewedCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
		favoritedCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) { nil }

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = Color.darkBlue

		for _ in 0..<10 {
			models.append(UserProfileEstate(
				image: Bundle.main.url(forResource: "villa1", withExtension: "jpg")!,
				price: UInt32.random(in: 100000...10000000),
				bedNum: UInt8.random(in: 1...10), bathNum: UInt8.random(in: 1...10))
			)
		}

		dataSource.models = models

		headerView.model = UserHeader(image: URL(fileURLWithPath: ""), name: "Neo Mode", city: "Toronto", social: [])
		headerView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(headerView)

		lastViewedLabel.backgroundColor = Color.darkBlue
		lastViewedLabel.text = "Last Viewed"
		lastViewedLabel.font = .bold(size: 16)
		lastViewedLabel.textColor = Color.white
		lastViewedLabel.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(lastViewedLabel)

		favoritedLabel.backgroundColor = Color.darkBlue
		favoritedLabel.text = "My Favorited"
		favoritedLabel.font = .bold(size: 16)
		favoritedLabel.textColor = Color.white
		favoritedLabel.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(favoritedLabel)

		layout.sectionInset = UIEdgeInsets(top: 0, left: .offset, bottom: 0, right: .offset)
		layout.itemSize = CGSize(width: 120, height: 130)
		layout.scrollDirection = .horizontal
		layout.minimumInteritemSpacing = 10

		lastViewedCollection.showsHorizontalScrollIndicator = false
		lastViewedCollection.backgroundColor = .clear
		lastViewedCollection.dataSource = dataSource
		lastViewedCollection.register(UserProfileEstateCell.self, forCellWithReuseIdentifier: "UserProfileEstateCell")
		lastViewedCollection.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(lastViewedCollection)

		favoritedCollection.showsHorizontalScrollIndicator = false
		favoritedCollection.backgroundColor = .clear
		favoritedCollection.dataSource = dataSource
		favoritedCollection.register(UserProfileEstateCell.self, forCellWithReuseIdentifier: "UserProfileEstateCell")
		favoritedCollection.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(favoritedCollection)

		NSLayoutConstraint.activate([
			headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

			lastViewedLabel.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 46),
			lastViewedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .offset),
			lastViewedLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.offset),

			lastViewedCollection.topAnchor.constraint(equalTo: lastViewedLabel.bottomAnchor, constant: 16),
			lastViewedCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			lastViewedCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			lastViewedCollection.heightAnchor.constraint(equalToConstant: 130),

			favoritedLabel.topAnchor.constraint(equalTo: lastViewedCollection.bottomAnchor, constant: 30),
			favoritedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .offset),
			favoritedLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.offset),

			favoritedCollection.topAnchor.constraint(equalTo: favoritedLabel.bottomAnchor, constant: 16),
			favoritedCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			favoritedCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			favoritedCollection.heightAnchor.constraint(equalToConstant: 130)
		])
	}
}
