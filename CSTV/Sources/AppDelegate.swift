import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewModel = MatchListViewModel()
        let viewController = MatchListViewContoller(viewModel: viewModel)
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        return true
    }
}
