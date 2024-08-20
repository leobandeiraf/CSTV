import UIKit

protocol Coordinating: AnyObject {
    var navigationController: UINavigationController { get set }
    var rootViewController: UIViewController? { get set }
    
    func start()
}

final class AppCoordinator: Coordinating {
    // MARK: - Property(ies).
    var navigationController: UINavigationController
    var rootViewController: UIViewController?
    
    // MARK: - Initialization.
    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }
    
    // MARK: - Method(s).
    func start() {
        let coordinator = MatchListCoordinator(navigationController: navigationController)
        coordinator.start()
    }
}
