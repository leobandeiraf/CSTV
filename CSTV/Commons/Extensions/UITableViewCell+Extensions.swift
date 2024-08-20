import UIKit

typealias TableViewCell = UITableViewCell & Configurable
extension UITableViewCell: Reusable {}

extension UITableViewCell {
    static func errorValue(with message: String) -> Self {
        assert(false, message)
        let cell = Self()
        cell.textLabel?.text = message
        return cell
    }
}
