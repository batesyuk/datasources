import UIKit

fileprivate let kMaxheight: CGFloat = 84

struct StretchySectionLayout {

  func update(item: Int,
              layout: UICollectionViewLayoutAttributes,
              offset: CGPoint) {
    layout.zIndex = 999
    if offset.y < 0 {
      extendFrame(layout: layout, offset: offset.y)
    } else {
      adjustedHeight(layout: layout, offset: offset.y)
    }
  }

  private func extendFrame(layout: UICollectionViewLayoutAttributes,
                           offset: CGFloat) {
    layout.frame.origin.y = offset
    layout.frame.size.height += -offset
  }

  private func adjustedHeight(layout: UICollectionViewLayoutAttributes,
                              offset: CGFloat) {
    let height = layout.frame.height - offset
    layout.frame.size.height = height >= kMaxheight ? height : kMaxheight
    layout.frame.origin.y = offset
  }

}
