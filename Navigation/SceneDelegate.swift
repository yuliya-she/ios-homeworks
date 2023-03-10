//
//  SceneDelegate.swift
//  Navigation
//
//  Created by мас on 20.02.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: scene)
        
        let feedViewController = FeedViewController()
        feedViewController.title = "Feed"
        feedViewController.view.backgroundColor = .systemYellow
        
        
        let profileViewController = ProfileViewController()
        profileViewController.title = "Profile"
        
        
        let feedNavigationController = UINavigationController(rootViewController: FeedViewController())
        let profileNavigationController = UINavigationController(rootViewController: ProfileViewController())
        
        let tabBarController = UITabBarController()
                
        
        feedViewController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "person"), tag: 0)
        profileViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "house"), tag: 1)
        
        
        let controllers = [feedViewController, profileViewController]
        tabBarController.viewControllers = controllers.map {
            UINavigationController(rootViewController: $0 )
        }
        
        tabBarController.selectedIndex = 0
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window
    }

    
    func sceneDidDisconnect(_ scene: UIScene) {
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

