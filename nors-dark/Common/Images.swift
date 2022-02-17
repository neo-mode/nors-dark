import UIKit

enum ImageName: String {
	case heartOff = "heart-off"
	case heartOn = "heart-on"
	case arrowDown = "arrow-down"
	case share
	case splash
}

extension UIImage {
	static func image(name: ImageName) -> UIImage {
		guard let image = UIImage(named: name.rawValue) else { assertionFailure("Image not found"); return UIImage() }
		return image
	}
}
