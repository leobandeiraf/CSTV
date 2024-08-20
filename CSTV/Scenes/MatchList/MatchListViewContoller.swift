import SnapKit
import UIKit

final class MatchListViewContoller: UIViewController {
    // MARK: - Property(ies).
    enum Section: CaseIterable { case matches }
    private let coordinator: MatchListCoordinating
    private let viewModel: MatchListViewModeling
    
    // MARK: - Component(s).
    private lazy var tableView = TableView<Section>()
        .backgroundColor(.backgroundColor ?? .black)
    
    // MARK: - Initialization.
    init(coordinator: MatchListCoordinating, viewModel: MatchListViewModeling) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    // MARK: - Override(s).
    override func viewDidLoad() {
        super.viewDidLoad()
        buildLayout()
    }
    
    // MARK: - Method(s).
    private func buildLayout() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
    
    private func buildViewHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func configureViews() {
        title = "Partidas"
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor.backgroundColor
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        let backImage = UIImage(named: "ic-arrow-left")
        navigationController?.navigationBar.backIndicatorImage = backImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        navigationController?.navigationBar.tintColor = .white
    }
}
