//
//  Fonts.swift
//  nors-dark
//
//  Created by Neo Mode on 01.02.2022.
//

import UIKit

extension UIFont {
	static func SF_bold(size: CGFloat) -> UIFont { .systemFont(ofSize: size, weight: .bold) }
	static func SF_semibold(size: CGFloat) -> UIFont { .systemFont(ofSize: size, weight: .semibold) }
	static func SF_medium(size: CGFloat) -> UIFont { .systemFont(ofSize: size, weight: .medium) }
	static func SF_regular(size: CGFloat) -> UIFont { .systemFont(ofSize: size, weight: .regular) }
}
