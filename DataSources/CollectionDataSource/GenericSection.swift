import Foundation

public struct GenericSection: CollectionSection {

  public var items: [CollectionItem]

  public init(_ items: [CollectionItem]) {
    self.items = items
  }
  
}
