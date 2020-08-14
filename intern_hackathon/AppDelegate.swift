import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // 選択済みのtabbar itemの色設定
        UITabBar.appearance().tintColor = UIColor(red: 24 / 255, green: 98 / 255, blue: 237 / 255, alpha: 100)
        
        // 未選択のtabbar itemの色設定
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MainTabBarController()
        window?.makeKeyAndVisible()
        
        return true
    }
}
