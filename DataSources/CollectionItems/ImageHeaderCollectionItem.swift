import UIKit

class StickyHeaderCollectionItem: CollectionItem {

  func cell(collectionView: UICollectionView,
            indexPath: IndexPath) -> UICollectionViewCell {
    let cell: StickyHeaderCell = collectionView.nib(indexPath: indexPath)
    return cell
  }

  func size(collectionView: UICollectionView,
            indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.size.width,
                  height: 200)
  }

}
