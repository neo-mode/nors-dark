//
//  Fonts.swift
//  nors-dark
//
//  Created by Neo Mode on 01.02.2022.
//

import UIKit

extension UIFont {

	static func SF_bold(size: CGFloat) -> UIFont {
		if let font = UIFont(name: "SFProDisplay-Bold", size: size) { return font }
		assertionFailure()
		return .systemFont(ofSize: size, weight: .bold)
	}

	static func SF_semibold(size: CGFloat) -> UIFont {
		if let font = UIFont(name: "SFProDisplay-Semibold", size: size) { return font }
		assertionFailure()
		return .systemFont(ofSize: size, weight: .semibold)
	}

	static func SF_medium(size: CGFloat) -> UIFont {
		if let font = UIFont(name: "SFProDisplay-Medium", size: size) { return font }
		assertionFailure()
		return .systemFont(ofSize: size, weight: .medium)
	}

	static func SF_regular(size: CGFloat) -> UIFont {
		if let font = UIFont(name: "SFProDisplay-Regular", size: size) { return font }
		assertionFailure()
		return .systemFont(ofSize: size, weight: .regular)
	}
}
