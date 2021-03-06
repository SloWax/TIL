//
//  SceneDelegate.swift
//  Dominos11_Starter
//
//  Created by Lee on 2020/05/26.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?


  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    window = UIWindow(windowScene: windowScene)
    
    let categoryVC = CategoryViewController()
    let wishListVC = WishListViewController()
    
    let categoryNavi = UINavigationController(rootViewController: categoryVC)
    let wishListNavi = UINavigationController(rootViewController: wishListVC)
    
    
    let tabBarController = UITabBarController()
    tabBarController.viewControllers = [categoryNavi, wishListNavi]
    
    categoryNavi.tabBarItem = UITabBarItem(title: "Domino's", image: UIImage(named: "domino's"), tag: 0)
    wishListNavi.tabBarItem = UITabBarItem(title: "Wish List", image: UIImage(named: "wishlist"), tag: 1)
    
    
    window?.rootViewController = tabBarController
    window?.backgroundColor = .systemBackground
    window?.makeKeyAndVisible()
    
  }
}

