import UIKit

final class MatchListViewContoller: UIViewController {
    // MARK: - Property(ies).
    private let viewModel: MatchListViewModeling
    
    // MARK: - Initialization.
    init(viewModel: MatchListViewModeling) {
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
