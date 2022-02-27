import UIKit

enum ImageName: String {
	case facebook
	case plusCircle = "plus-circle"
	case heartOff = "heart-off"
	case twitter
	case minusCircle = "minus-circle"
	case instagram
	case heartOn = "heart-on"
	case arrowDown = "arrow-down"
	case share
	case settings
	case search
	case splash
}

extension UIImage {
	static func image(name: ImageName) -> UIImage {
		if let image = UIImage(named: name.rawValue) { return image }
		assertionFailure("Image not found")
		return UIImage()
	}
}
