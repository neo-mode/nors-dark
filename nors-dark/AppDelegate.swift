//
//  AppDelegate.swift
//  nors-dark
//
//  Created by Neo Mode on 01.02.2022.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

		let window = UIWindow()
		self.window = window

		if #available(iOS 13.0, *) {
			window.overrideUserInterfaceStyle = .dark
		}

		window.rootViewController = Test()
		window.makeKeyAndVisible()
		return true
	}
}

class Test: UIViewController {

	private let hview = SliderView()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = Color.darkGray

		hview.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(hview)

		NSLayoutConstraint.activate([
			hview.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
			hview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
			hview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
		])
	}
}
