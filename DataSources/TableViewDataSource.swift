import UIKit

protocol TableViewCellItem {
  func dequeue(tableView: UITableView,
               indexPath: IndexPath) -> UITableViewCell
}

class TableViewDataSource: NSObject,
                           UITableViewDataSource,
                           UITableViewDelegate {

  private let tableView: UITableView
  private let items: [TableViewCellItem]

  init(tableView: UITableView,
       items: [TableViewCellItem]) {
    self.tableView = tableView
    self.items = items
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection
                 section: Int) -> Int {
    return items.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt
                 indexPath: IndexPath) -> UITableViewCell {
    return items[indexPath.item].dequeue(tableView:tableView,
                                         indexPath: indexPath)
  }

}
