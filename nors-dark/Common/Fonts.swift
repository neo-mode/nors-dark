//
//  Fonts.swift
//  nors-dark
//
//  Created by Neo Mode on 01.02.2022.
//

import UIKit

extension UIFont {
	static func bold(size: CGFloat) -> UIFont { .systemFont(ofSize: size, weight: .bold) }
	static func semibold(size: CGFloat) -> UIFont { .systemFont(ofSize: size, weight: .semibold) }
	static func medium(size: CGFloat) -> UIFont { .systemFont(ofSize: size, weight: .medium) }
	static func regular(size: CGFloat) -> UIFont { .systemFont(ofSize: size, weight: .regular) }
}
