import UIKit

struct FloatingAvatarLayout {

  private let stretchySectionLayout = StretchySectionLayout()

  func update(item: Int,
              layout: UICollectionViewLayoutAttributes,
              offset: CGPoint,
              yDelta: inout CGFloat) {
    switch item {
    case 0:
      stretchySectionLayout.update(item: item,
                                   layout: layout,
                                   offset: offset)
    case 1:
      logoImage(layout: layout,
                yDelta: &yDelta)
    default:
      break
    }
  }

  private func logoImage(layout: UICollectionViewLayoutAttributes,
                         yDelta: inout CGFloat) {
    let delta = layout.frame.size.height / 2
    layout.zIndex = 1000
    layout.frame.origin.y = layout.frame.origin.y - delta
    yDelta = delta * 2
  }

}
