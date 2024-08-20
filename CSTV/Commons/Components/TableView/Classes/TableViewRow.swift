import UIKit

class TableViewRow<Cell>: CellProvider, Tappable where Cell: TableViewCell {
    // MARK: - Property(ies).
    private var model: Cell.Model
    private var tapClosure: ((_ tableView: UITableView, _ indexPath: IndexPath, _ cell: Cell) -> Void)?
    
    // MARK: - Initialization.
    init(model: Cell.Model, tapClosure: ((_ tableView: UITableView, _ indexPath: IndexPath, _ cell: Cell) -> Void)? = nil) {
        self.model = model
        self.tapClosure = tapClosure
    }
    
    // MARK: - Method(s).
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: Cell = tableView.dequeueCell(at: indexPath)
        return cell.configure(with: model)
    }
    
    func performTap(_ tableView: UITableView, at indexPath: IndexPath) {
        tapClosure?(tableView, indexPath, tableView.dequeueCell(at: indexPath))
    }
}
