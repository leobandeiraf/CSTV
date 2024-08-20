import UIKit

public protocol Tappable {
    func performTap(_ tableView: UITableView, at indexPath: IndexPath)
}
