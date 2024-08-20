import UIKit

final class MatchListViewContoller: UIViewController {
    // MARK: - Property(ies).
    private let coordinator: MatchListCoordinating
    private let viewModel: MatchListViewModeling
    
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
        view.backgroundColor = .systemPink
    }
}
