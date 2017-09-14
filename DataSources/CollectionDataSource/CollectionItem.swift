import Foundation
import UIKit

public protocol CollectionItem {
  var isSelected: Bool { get }
  func cell(collectionView: UICollectionView,
            indexPath: IndexPath) -> UICollectionViewCell
  func selected()
  func deselected()
  func size(collectionView: UICollectionView,
            indexPath: IndexPath) -> CGSize
  var identifier: String { get }
}

public extension CollectionItem {
  var isSelected: Bool { return false }
  func selected() {}
  func deselected() {}
  var identifier: String { return UUID().uuidString }
}
