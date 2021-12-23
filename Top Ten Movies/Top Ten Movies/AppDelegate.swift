import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let frame = HomeWireFrame(in: window)
        frame.rootHomeViewController()
        // Override point for customization after application launch.
        return true
    }


    // MARK: UISceneSession Lifecycle

    


}

