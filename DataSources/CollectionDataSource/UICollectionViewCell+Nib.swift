import UIKit

public extension UICollectionViewCell {

  static var nib: UINib {
    return UINib(nibName: String(describing: self),
                 bundle: Bundle(for: self))
  }

}
