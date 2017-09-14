import UIKit

struct SingleCellItem: TableViewCellItem {

  private let title: String

  init(title: String) {
    self.title = title
  }

  func dequeue(tableView: UITableView,
               indexPath: IndexPath) -> UITableViewCell {
    let cell: TitleCell = tableView.dequeue(indexPath: indexPath)
    cell.title = title
    return cell
  }

}

extension UITableView {

  func dequeue<C>(indexPath: IndexPath) -> C where C: UITableViewCell {
    let identifier = String(describing: C.self)
    return dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! C
  }

}
