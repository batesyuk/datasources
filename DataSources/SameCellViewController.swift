import UIKit

class SameCellViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!

  private var dataSource: TableViewDataSource?

  override func viewDidLoad() {
    super.viewDidLoad()
    loadDataSource()
  }

  private func loadDataSource() {
    dataSource = TableViewDataSource(tableView: tableView,
                                     items: items)
  }

  private var items: [SingleCellItem] {
    return [
      "Cell 1",
      "Cell 2",
      "Cell 3",
      "Cell 4",
    ].map(SingleCellItem.init)
  }

}

