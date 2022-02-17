//
//  DetailViewController.swift
//  nors-dark
//
//  Created by Neo Mode on 10.02.2022.
//

import UIKit

final class DetailViewController: UIViewController {

	private let model: DetailInfo
	private let detailInfoView: DetailInfoView
	private let callNowButton = Button(style: .blue, title: "Call Now")

	init(model: DetailInfo) {
		self.model = model
		detailInfoView =  DetailInfoView(model: model, style: .detail)
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) { nil }

	override func loadView() {
		let imageView = UIImageView(
			image: UIImage(contentsOfFile: Bundle.main.url(forResource: "villa1", withExtension: "jpg")!.path)
		)
		imageView.isUserInteractionEnabled = true
		imageView.contentMode = .scaleAspectFill
		view = imageView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = Color.black

		detailInfoView.layer.cornerRadius = 27
		detailInfoView.backgroundColor = Color.middleGray2.withAlphaComponent(0.7)

		detailInfoView.translatesAutoresizingMaskIntoConstraints = false
		callNowButton.translatesAutoresizingMaskIntoConstraints = false

		view.addSubview(detailInfoView)
		view.addSubview(callNowButton)

		NSLayoutConstraint.activate([
			detailInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
			detailInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),

			callNowButton.topAnchor.constraint(equalTo: detailInfoView.bottomAnchor, constant: 20),
			callNowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
			callNowButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
			callNowButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -44),
		])
	}
}
