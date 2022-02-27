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

		window.rootViewController = SearchViewController()
		window.makeKeyAndVisible()
		return true
	}
}
