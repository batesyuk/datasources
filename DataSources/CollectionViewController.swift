import UIKit

class CollectionViewController: UIViewController {

  @IBOutlet weak var collectionView: UICollectionView!

  private var dataSource: CollectionViewDataSource?

  override func viewDidLoad() {
    super.viewDidLoad()
    loadDataSource()
  }

  private func loadDataSource() {
    collectionView.collectionViewLayout = AvatarCollectionLayout()
    dataSource = CollectionViewDataSource(collectionView: collectionView,
                                          sections: sections)
  }

  private var sections: [CollectionSection] {
    return [
      GenericSection(headerItems),
      GenericSection(bodySectionItems)
    ]
  }

  private var headerItems: [CollectionItem] {
    return [
      StickyHeaderCollectionItem(),
      AvatarCollectionItem()
    ]
  }

  private var bodySectionItems: [CollectionItem] {
    return [
      PlaceholderCollectionItem(),
      PlaceholderCollectionItem(),
      PlaceholderCollectionItem(),
      PlaceholderCollectionItem(),
      PlaceholderCollectionItem(),
      PlaceholderCollectionItem(),
      PlaceholderCollectionItem(),
      PlaceholderCollectionItem(),
      PlaceholderCollectionItem(),
      PlaceholderCollectionItem(),
      PlaceholderCollectionItem(),
      PlaceholderCollectionItem(),
      PlaceholderCollectionItem(),
      PlaceholderCollectionItem(),
      PlaceholderCollectionItem(),
      PlaceholderCollectionItem(),
      PlaceholderCollectionItem(),
      PlaceholderCollectionItem(),
      PlaceholderCollectionItem(),
      PlaceholderCollectionItem(),
      PlaceholderCollectionItem(),
      PlaceholderCollectionItem()
    ]
  }

}
