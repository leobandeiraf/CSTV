import UIKit

protocol MatchListCoordinating: AnyObject {
    func goToMatchDetails()
}

final class MatchListCoordinator: Coordinating {
    // MARK: - Property(ies).
    var navigationController: UINavigationController
    var rootViewController: UIViewController?
    
    // MARK: - Initialization.
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Method(s).
    func start() {
        let viewModel = MatchListViewModel()
        let viewController = MatchListViewContoller(coordinator: self, viewModel: viewModel)
        rootViewController = viewController
        navigationController.pushViewController(viewController, animated: true)
    }
}

// MARK: - MatchListCoordinating Method(s).
extension MatchListCoordinator: MatchListCoordinating {
    func goToMatchDetails() { }
}
