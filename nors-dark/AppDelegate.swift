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

		window.rootViewController = TestController()
		window.makeKeyAndVisible()
		return true
	}
}

final class TestController: UIViewController {

	let stepperView = StepperView()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white

		stepperView.minValue = 0
		stepperView.maxValue = 10
		stepperView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(stepperView)

		NSLayoutConstraint.activate([
			stepperView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			stepperView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		])
	}
}
