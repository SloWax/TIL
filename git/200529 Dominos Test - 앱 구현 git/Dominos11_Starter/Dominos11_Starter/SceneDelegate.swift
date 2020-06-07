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
//    let productVC = ProductViewController()
//    let detailVC = DetailViewController()
    let wishListVC = WishListViewController()
    
    let categoryNavi = UINavigationController(rootViewController: categoryVC)
    let wishListNavi = UINavigationController(rootViewController: wishListVC)
    
//    navigationController.navigationBar.prefersLargeTitles = true
//    navigationController.navigationItem.largeTitleDisplayMode = .never
    
    let tabBarController = UITabBarController()
    tabBarController.viewControllers = [categoryNavi, wishListNavi]
    
    categoryNavi.tabBarItem = UITabBarItem(title: "Domino's", image: UIImage(systemName: "domino's"), tag: 0)
    wishListNavi.tabBarItem = UITabBarItem(title: "Wish List", image: UIImage(systemName: "wishlist"), tag: 1)
    
    
    window?.rootViewController = tabBarController
    window?.backgroundColor = .systemBackground
    window?.makeKeyAndVisible()
    
  }
}

