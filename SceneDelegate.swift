import CareKit
import UIKit
import Foundation
import ResearchKit
import CareKitUI
import CareKitStore
import SwiftUI
import HealthKit
import CloudKit
import LocalAuthentication
import LocalAuthenticationEmbeddedUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var storeManager: OCKSynchronizedStoreManager {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.storeManager
    }

    var window: UIWindow?
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions) {
            window = UIWindow(windowScene: scene as! UIWindowScene)
            
            let step = UIHostingController(rootView: ContentView())
            window?.rootViewController = step
            window?.makeKeyAndVisible()

        }
}
//MH.view.translatesAutoresizingMaskIntoConstraints = false
//MH.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//MH.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//MH.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//MH.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//class SceneDelegate: UIResponder, UIWindowSceneDelegate {
//
//    var window: UIWindow?
//
//    func scene(_ scene: UIScene,
//               willConnectTo session: UISceneSession,
//               options connectionOptions: UIScene.ConnectionOptions) {
//
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let manager = appDelegate.synchronizedStoreManager
//        let careViewController = UINavigationController(rootViewController: CareViewController(storeManager: manager))
//
//        let permissionViewController = UIViewController()
//        permissionViewController.view.backgroundColor = .white
//        if let windowScene = scene as? UIWindowScene {
//            window = UIWindow(windowScene: windowScene)
//            window?.rootViewController = permissionViewController
//            window?.tintColor = UIColor { $0.userInterfaceStyle == .light ? #colorLiteral(red: 0.9960784314, green: 0.3725490196, blue: 0.368627451, alpha: 1) : #colorLiteral(red: 0.8627432641, green: 0.2630574384, blue: 0.2592858295, alpha: 1) }
//            window?.makeKeyAndVisible()
//
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//                appDelegate.healthKitStore.requestHealthKitPermissionsForAllTasksInStore { _ in
//                    DispatchQueue.main.async {
//                        self.window?.rootViewController = careViewController
//                    }
//                }
//            }
//        }
//    }
//}
