import UIKit

final class AvatarCollectionLayout: UICollectionViewFlowLayout {

  private let imageSectionLayout = FloatingAvatarLayout()
  private var yDelta: CGFloat = 0

  override func prepare() {
    super.prepare()
    minimumLineSpacing = 0
    minimumInteritemSpacing = 0
    yDelta = 80
    collectionView?.contentInset.bottom = -yDelta
  }

  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    var rect = rect
    rect.size.height += yDelta
    let attributes = super.layoutAttributesForElements(in: rect)
    var outElements = update(attributes)
    if let item = layoutAttributesForItem(at: IndexPath(item: 0, section: 0)) {
      outElements?.append(item)
    }
    return outElements
  }

  override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
    let layout = super.layoutAttributesForItem(at: indexPath)
    return update(layout)
  }

  private func update(_ layouts: [UICollectionViewLayoutAttributes]?) -> [UICollectionViewLayoutAttributes]? {
    return layouts?.flatMap(update)
  }

  private func update(_ layout: UICollectionViewLayoutAttributes?) -> UICollectionViewLayoutAttributes? {
    guard let attributes = layout?.copy() as? UICollectionViewLayoutAttributes,
      let offset = collectionView?.contentOffset
      else { return layout }
    return update(attributes, offset: offset)
  }

  private func update(_ layout: UICollectionViewLayoutAttributes,
                      offset: CGPoint) -> UICollectionViewLayoutAttributes? {
    switch layout.indexPath.section {
    case 0:
      imageSectionLayout.update(item: layout.indexPath.item,
                                layout: layout,
                                offset: offset,
                                yDelta: &yDelta)
    default:
      layout.frame.origin.y -= yDelta
      break
    }
    return layout
  }

  override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
    return true
  }

}
