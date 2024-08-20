import UIKit

public final class TableView<Section>: UITableView,
                                       UITableViewDataSource,
                                       UITableViewDelegate where Section: Hashable & CaseIterable {
    // MARK: - Property(ies).
    public private(set) var sections = [TableViewSection<Section>]()
    
    public private(set) var cells = [Reusable.Type]() {
        didSet { cells.forEach(registerCell) }
    }
    
    public private(set) var views = [Reusable.Type]() {
        didSet { views.forEach(registerFooterHeader) }
    }
    
    public private(set) var deselectRow: Bool = true {
        didSet { reloadData() }
    }
    
    // MARK: - Initialization(s).
    public override init(frame: CGRect = .zero, style: UITableView.Style = .grouped) {
        super.init(frame: frame, style: style)
        configure()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Method(s).
    private func configure() {
        if #available(iOS 15.0, *) { sectionHeaderTopPadding = CGFloat.leastNonzeroMagnitude }
        dataSource = self
        delegate = self
        separatorStyle = .none
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        sections = Section.allCases.map { TableViewSection(id: $0) }
        reloadData()
    }
    
    // MARK: - TableView Method(s).
    /// The UITableView’s background color.
    @discardableResult
    public func backgroundColor(_ value: UIColor) -> Self {
        backgroundColor = value
        return self
    }
    
    /// The UITableView’s background view.
    @discardableResult
    public func backgroundView(_ value: UIView?) -> Self {
        backgroundView = value
        return self
    }
    
    /// The custom distance that the content view is inset from the safe area or scroll view edges.
    @discardableResult
    public func contentInset(_ value: UIEdgeInsets) -> Self {
        contentInset = value
        return self
    }
    
    /// Deselects a row that an index path identifies, with an option to animate the deselection. Default value is true.
    @discardableResult
    public func deselectRow(_ value: Bool) -> Self {
        deselectRow = value
        return self
    }
    
    @discardableResult
    public func register(cells: any TableViewCell.Type...) -> Self {
        self.cells.append(contentsOf: cells)
        return self
    }
    
    @discardableResult
    public func register(views: Reusable.Type...) -> Self {
        self.views.append(contentsOf: views)
        return self
    }
    
    public func removeAllContent() {
        sections.enumerated().forEach { sections[$0.offset].removeRows() }
    }
    
    // MARK: - Header and Footer Method(s).
    public func add(header: UITableViewHeaderFooterView, in section: Section) {
        sections.enumerated().forEach {
            guard $0.element.id == section else { return }
            sections[$0.offset].addHeader(header)
        }
    }
    
    public func add(footer: UITableViewHeaderFooterView, in section: Section) {
        sections.enumerated().forEach {
            guard $0.element.id == section else { return }
            sections[$0.offset].addFooter(footer)
        }
    }
    
    public func remove(headerIn section: Section) {
        sections.enumerated().forEach {
            guard $0.element.id == section else { return }
            sections[$0.offset].removeHeader()
        }
    }
    
    public func remove(footerIn section: Section) {
        sections.enumerated().forEach {
            guard $0.element.id == section else { return }
            sections[$0.offset].removeFooter()
        }
    }
    
    // MARK: - Rows Method(s).
    public func add(row: TableViewSection.Row, in section: Section) {
        add(rows: [row], in: section)
    }
    
    public func add(rows: [TableViewSection.Row], in section: Section) {
        sections.enumerated().forEach {
            guard $0.element.id == section else { return }
            sections[$0.offset].addRows(rows)
        }
        reloadData()
    }
    
    public func update(row: TableViewSection.Row, in section: Section) {
        update(rows: [row], in: section)
    }
    
    public func update(rows: [TableViewSection.Row], in section: Section) {
        remove(rowsAt: section)
        sections.enumerated().forEach {
            guard $0.element.id == section else { return }
            sections[$0.offset].addRows(rows)
        }
        reloadData()
    }
    
    public func remove(rowsAt section: Section) {
        for item in sections.enumerated() where item.element.id == section {
            sections[item.offset].removeRows()
        }
        reloadData()
    }
    
    public func reloadSections(_ values: Section...) {
        sections.enumerated().forEach { section in
            values.forEach {
                if section.element.id == $0 {
                    reloadSections(IndexSet(integer: section.offset), with: .none)
                }
            }
        }
    }
    
    // MARK: - TableView DataSource.
    public func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].numberOfRows
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        sections[indexPath.section].tableView(tableView, cellForRowAt: indexPath)
    }
    
    // MARK: - TableView Delegate.
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if deselectRow { tableView.deselectRow(at: indexPath, animated: true) }
        sections[indexPath.section].tapOnRow(tableView, at: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        sections[section].header
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        sections[section].footer
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if sections[section].header != nil { return UITableView.automaticDimension }
        if tableView.sectionHeaderHeight > 0 { return tableView.sectionHeaderHeight }
        return CGFloat.leastNonzeroMagnitude
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if sections[section].footer != nil { return UITableView.automaticDimension }
        if tableView.sectionFooterHeight > 0 { return tableView.sectionFooterHeight }
        return CGFloat.leastNonzeroMagnitude
    }
}
