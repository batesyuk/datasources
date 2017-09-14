import Foundation
import UIKit

open class CollectionViewDataSource: NSObject {

  @IBOutlet weak var collectionView: UICollectionView!

  public fileprivate(set) var sections: [CollectionSection]

  public init(collectionView: UICollectionView,
              sections: [CollectionSection]) {
    self.collectionView = collectionView
    self.sections = sections
    super.init()
    collectionView.delegate = self
    collectionView.dataSource = self
    updateSelected()
  }

  public convenience init(collectionView: UICollectionView,
                          items: [CollectionItem]) {
    self.init(collectionView: collectionView,
              sections: [ GenericSection(items) ])
  }

  public func item(indexPath: IndexPath) -> CollectionItem {
    return sections[indexPath.section].items[indexPath.item]
  }

  public func deselectAllCells(animated: Bool = true) {
    collectionView.indexPathsForSelectedItems?.forEach {
      collectionView.deselectItem(at: $0, animated: animated)
    }
  }

  private func updateSelected() {
    let indexPaths: [IndexPath] = []
    let selectedIndexPaths = sections.enumerated().reduce(indexPaths) {
      (currentIndexes, stuff) -> [IndexPath] in
      return currentIndexes + self.selectedIndexPaths(sectionIndex: stuff.offset, section: stuff.element)
    }
    select(indexPaths: selectedIndexPaths)
  }

  private func selectedIndexPaths(sectionIndex: Int,
                                  section: CollectionSection) -> [IndexPath] {
    return section.items.enumerated().flatMap {
      $1.isSelected ? IndexPath(item: $0, section: sectionIndex) : nil
    }
  }

  private func select(indexPaths: [IndexPath]) {
    indexPaths.forEach {
      collectionView.selectItem(at: $0, animated: false, scrollPosition: .left)
    }
  }

}

extension CollectionViewDataSource: UICollectionViewDelegateFlowLayout {

  public func collectionView(_ collectionView: UICollectionView, cellForItemAt
                             indexPath: IndexPath) -> UICollectionViewCell {
    return sections[indexPath.section]
            .cell(collectionView: collectionView,
                  indexPath: indexPath)
  }

  public func collectionView(_ collectionView: UICollectionView, layout
                             collectionViewLayout: UICollectionViewLayout, sizeForItemAt
                      indexPath: IndexPath) -> CGSize {
    return sections[indexPath.section]
            .size(collectionView: collectionView,
                  indexPath: indexPath)
  }

  public func collectionView(_ collectionView: UICollectionView, didSelectItemAt
                             indexPath: IndexPath) {
    sections[indexPath.section]
      .selected(indexPath: indexPath)
  }

  public func collectionView(_ collectionView: UICollectionView, didDeselectItemAt
                             indexPath: IndexPath) {
    sections[indexPath.section]
      .deselected(indexPath: indexPath)
  }

}

extension CollectionViewDataSource: UICollectionViewDataSource {

  public func numberOfSections(in collectionView: UICollectionView) -> Int {
    return sections.count
  }

  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection
                             section: Int) -> Int {
    return sections[section].cellCount
  }

}

extension CollectionViewDataSource {

  public func update(_ item: CollectionItem) {
    guard let indexPath = indexPath(item)
      else { return }
    var section = sections.remove(at: indexPath.section)
    section.items.remove(at: indexPath.item)
    section.items.insert(item, at: indexPath.item)
    sections.insert(section, at: indexPath.section)
    perform(updateIndexes: [indexPath])
  }

}

extension CollectionViewDataSource {

  public func add(_ item: CollectionItem) {
    sections[0].items.append(item)
    let index = sections[0].cellCount-1
    collectionView.performBatchUpdates ({ [weak self] in
      let indexPath = IndexPath(item: index, section: 0)
      self?.collectionView.insertItems(at: [indexPath])
    })
  }

}

extension CollectionViewDataSource {

  public func delete(_ item: CollectionItem) {
    if let indexPath = indexPath(item) {
      perform(deleteIndexes: [indexPath])
    }
  }

  public func delete(_ items: [CollectionItem]) {
    perform(deleteIndexes: indexPaths(items: items))
  }

  fileprivate func perform(deleteIndexes: [IndexPath] = [],
                           updateIndexes: [IndexPath] = []) {
    collectionView.performBatchUpdates({ [weak self] in
      self?.delete(deleteIndexes)
      self?.collectionView.reloadItems(at: updateIndexes)
    })
  }

  private func delete(_ deleteIndexes: [IndexPath]) {
    deleteIndexes.forEach { sections[$0.section].items.remove(at: $0.item) }
    collectionView.deleteItems(at: deleteIndexes)
  }

  private func indexPaths(items: [CollectionItem]) -> [IndexPath] {
    return items.map(indexPath).flatMap{ $0 }
  }

  fileprivate func indexPath(_ item: CollectionItem) -> IndexPath? {
    for (sectionIndex, section) in sections.enumerated() {
      if let index = section.index(item) {
        return IndexPath(item: index, section: sectionIndex)
      }
    }
    return nil
  }

}
