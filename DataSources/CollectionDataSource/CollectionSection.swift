import UIKit

public protocol CollectionSection {
  var items: [CollectionItem] { get set }
  var cellCount: Int { get }
  func cell(collectionView: UICollectionView,
            indexPath: IndexPath) -> UICollectionViewCell
  func selected(indexPath: IndexPath)
  func deselected(indexPath: IndexPath)
  func size(collectionView: UICollectionView,
            indexPath: IndexPath) -> CGSize
}

public protocol CollectionSectionHeader {
  func headerView(_ collectionView: UICollectionView,
                  indexPath: IndexPath) -> UICollectionReusableView
  func headerSize(_ collectionView: UICollectionView) -> CGSize
}

public extension CollectionSection {

  func cell(collectionView: UICollectionView,
            indexPath: IndexPath) -> UICollectionViewCell {
    return items[indexPath.item].cell(collectionView: collectionView,
                                      indexPath: indexPath)
  }

  func size(collectionView: UICollectionView,
            indexPath: IndexPath) -> CGSize {
    return items[indexPath.item].size(collectionView: collectionView,
                                      indexPath: indexPath)
  }

  func selected(indexPath: IndexPath) {
    items[indexPath.item].selected()
  }

  func deselected(indexPath: IndexPath) {
    items[indexPath.item].deselected()
  }

  var cellCount: Int {
    return items.count
  }

}

public extension CollectionSection {

  public func index(_ item: CollectionItem) -> Int? {
    return items.index(where: { $0.identifier == item.identifier } )
  }

}
