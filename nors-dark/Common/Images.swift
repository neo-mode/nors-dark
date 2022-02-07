import UIKit

enum ImageName: String {
	case splash
}

extension UIImage {
	static func image(name: ImageName) -> UIImage {
		guard let image = UIImage(named: name.rawValue) else { assertionFailure("Image not found"); return UIImage() }
		return image
	}
}
