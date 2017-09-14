import UIKit

extension UICollectionView {

  public func nib<T: UICollectionViewCell>(indexPath: IndexPath) -> T {
    self.register(T.nib, forCellWithReuseIdentifier: String(describing: T.self))
    return self.dequeue(indexPath: indexPath)
  }

  public func dequeue<T: UICollectionViewCell>(indexPath: IndexPath) -> T {
    return self.dequeue(cellType: T.self, indexPath: indexPath)
  }

  public func dequeue<T: UICollectionViewCell>(cellType: UICollectionViewCell.Type,
                      indexPath: IndexPath) -> T {
    return self.dequeueReusableCell(withReuseIdentifier: String(describing: cellType),
                                    for: indexPath) as! T
  }

}
