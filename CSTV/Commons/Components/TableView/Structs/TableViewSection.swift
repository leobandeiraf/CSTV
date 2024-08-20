import UIKit

public struct TableViewSection<Section: Hashable> {
    // MARK: - Property(ies).
    public typealias Row = CellProvider & Tappable
    
    public var numberOfRows: Int { rows.count }
    public private(set) var id: Section
    public private(set) var header: UITableViewHeaderFooterView?
    public private(set) var rows: [Row]
    public private(set) var footer: UITableViewHeaderFooterView?
    
    
    // MARK: - Initialization.
    public init(id: Section, rows: [Row] = []) {
        self.id = id
        self.rows = rows
    }
}

public extension TableViewSection {
    mutating func addHeader(_ header: UITableViewHeaderFooterView) {
        self.header = header
    }
    
    mutating func addFooter(_ footer: UITableViewHeaderFooterView) {
        self.footer = footer
    }
    
    mutating func addRows(_ rows: [Row]) {
        self.rows.append(contentsOf: rows)
    }
    
    mutating func removeHeader() {
        self.header = nil
    }
        
    mutating func removeFooter() {
        self.footer = nil
    }
    
    mutating func removeRows() {
        self.rows.removeAll()
    }
}

public extension TableViewSection {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        rows[indexPath.row].tableView(tableView, cellForRowAt: indexPath)
    }

    func tapOnRow(_ tableView: UITableView, at indexPath: IndexPath) {
        rows[indexPath.row].performTap(tableView, at: indexPath)
    }
}
