import UIKit

class AvatarCollectionItem: CollectionItem {

  func cell(collectionView: UICollectionView,
            indexPath: IndexPath) -> UICollectionViewCell {
    let cell: AvatarImageCell = collectionView.nib(indexPath: indexPath)
    return cell
  }

  func size(collectionView: UICollectionView,
            indexPath: IndexPath) -> CGSize {
    return CGSize(width: 80,
                  height: 80)
  }

}
