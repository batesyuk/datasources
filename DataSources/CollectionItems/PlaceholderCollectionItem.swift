import UIKit

class PlaceholderCollectionItem: CollectionItem {

  func cell(collectionView: UICollectionView,
            indexPath: IndexPath) -> UICollectionViewCell {
    let cell: PlaceholderCollectionViewCell = collectionView.nib(indexPath: indexPath)
    return cell
  }

  func size(collectionView: UICollectionView,
            indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width,
                  height: 80)
  }

}

