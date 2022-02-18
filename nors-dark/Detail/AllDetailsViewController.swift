//
//  AllDetailsViewController.swift
//  nors-dark
//
//  Created by Neo Mode on 11.02.2022.
//

import UIKit
import MapKit

final class AllDetailsViewController: UIViewController {

	private let model: DetailInfo
	private let detailInfoView: DetailInfoView

	private let descrLabel = UILabel()
	private let descrTextLabel = UILabel()

	private let photosLabel = UILabel()
	private let collectionLayout: UICollectionViewFlowLayout
	private let collectionView: UICollectionView

	private let mapView = MKMapView()

	private let shareButton = UIButton()
	private let callButton = Button(style: .blue, title: "Call Now")

	private let cellID = String(describing: PhotoCell.self)

	init(model: DetailInfo) {
		self.model = model
		detailInfoView =  DetailInfoView(model: model, style: .detail)
		collectionLayout = UICollectionViewFlowLayout()
		collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) { nil }

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = Color.black

		detailInfoView.translatesAutoresizingMaskIntoConstraints = false

		descrLabel.text = "Description"
		descrLabel.font = .semibold(size: 12)
		descrLabel.textColor = Color.white
		descrLabel.translatesAutoresizingMaskIntoConstraints = false

		let pStyle = NSMutableParagraphStyle()
		pStyle.lineHeightMultiple = 1.32

		descrTextLabel.attributedText = NSAttributedString(string: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", attributes: [.paragraphStyle: pStyle])

		descrTextLabel.font = .regular(size: 14)
		descrTextLabel.textColor = Color.darkGray
		descrTextLabel.numberOfLines = 0
		descrTextLabel.translatesAutoresizingMaskIntoConstraints = false

		photosLabel.text = "Photos"
		photosLabel.font = .semibold(size: 12)
		photosLabel.textColor = Color.white
		photosLabel.translatesAutoresizingMaskIntoConstraints = false

		let offset = CGFloat.offset - 5
		collectionLayout.scrollDirection = .horizontal
		collectionLayout.itemSize = CGSize(width: 103, height: 80)
		collectionLayout.sectionInset = UIEdgeInsets(top: 0, left: offset, bottom: 0, right: offset)

		collectionView.backgroundColor = .clear
		collectionView.showsHorizontalScrollIndicator = false
		collectionView.dataSource = self
		collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: cellID)
		collectionView.translatesAutoresizingMaskIntoConstraints = false

		mapView.setRegion(
			MKCoordinateRegion(
				center: CLLocationCoordinate2D(latitude: 45.0578614, longitude: 38.966086),
				span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
			),
			animated: false
		)
		mapView.translatesAutoresizingMaskIntoConstraints = false

		shareButton.backgroundColor = .white
		shareButton.layer.cornerRadius = 20
		shareButton.setContentHuggingPriority(.required, for: .horizontal)
		shareButton.setImage(.image(name: .share), for: .normal)
		shareButton.contentEdgeInsets = UIEdgeInsets(top: 14, left: 17, bottom: 14, right: 17)
		shareButton.addTarget(self, action: #selector(shareAction), for: .touchUpInside)
		shareButton.translatesAutoresizingMaskIntoConstraints = false

		callButton.addTarget(self, action: #selector(callAction), for: .touchUpInside)
		callButton.translatesAutoresizingMaskIntoConstraints = false

		let mapHeight: CGFloat = 320
		let gradient = CAGradientLayer()
		gradient.frame = CGRect(x: 0, y: 0, width: view.bounds.maxY, height: 50)
//		gradient.locations = [0, 0.7, 1]
		gradient.colors = [
			Color.black.cgColor,
//			Color.black.withAlphaComponent(0.5).cgColor,
			Color.black.withAlphaComponent(0).cgColor
		]

		mapView.layer.addSublayer(gradient)

		view.addSubview(mapView)
		view.addSubview(detailInfoView)
		view.addSubview(descrLabel)
		view.addSubview(descrTextLabel)
		view.addSubview(photosLabel)
		view.addSubview(collectionView)
		view.addSubview(shareButton)
		view.addSubview(callButton)

		NSLayoutConstraint.activate([
			detailInfoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
			detailInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			detailInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

			descrLabel.topAnchor.constraint(equalTo: detailInfoView.bottomAnchor, constant: 25),
			descrLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .offset),
			descrLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.offset),

			descrTextLabel.topAnchor.constraint(equalTo: descrLabel.bottomAnchor, constant: 10),
			descrTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .offset),
			descrTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.offset),

			photosLabel.topAnchor.constraint(equalTo: descrTextLabel.bottomAnchor, constant: 25),
			photosLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .offset),
			photosLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.offset),

			collectionView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 10),
			collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			collectionView.heightAnchor.constraint(equalToConstant: 80),

			mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			mapView.heightAnchor.constraint(equalToConstant: mapHeight),

			shareButton.topAnchor.constraint(greaterThanOrEqualTo: collectionView.bottomAnchor),
			shareButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .offset),
			shareButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -44),

			callButton.topAnchor.constraint(greaterThanOrEqualTo: collectionView.bottomAnchor),
			callButton.leadingAnchor.constraint(equalTo: shareButton.trailingAnchor, constant: 30),
			callButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.offset),
			callButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -44)
		])
	}

	@objc private func shareAction() {
		print(#function)
	}

	@objc private func callAction() {
		print(#function)
	}
}

extension AllDetailsViewController: UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 10
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! PhotoCell
		return cell
	}
}
