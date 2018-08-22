//
//  MainTabBarController.swift
//  ItunesSearcher
//
//  Created by Victor Chang on 17/08/2018.
//  Copyright © 2018 Victor Chang. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		UINavigationBar.appearance().prefersLargeTitles = true
			
//		let musicNavController = UINavigationController(rootViewController: ViewController())
//		musicNavController.tabBarItem.title = "Music"
//		musicNavController.tabBarItem.image = #imageLiteral(resourceName: "favorites")
//
//		let filmNavController = UINavigationController(rootViewController: ViewController())
//		filmNavController.tabBarItem.title = "Film"
//		filmNavController.tabBarItem.image = nil
//
//		let tvShowNavController = UINavigationController(rootViewController: ViewController())
//		tvShowNavController.tabBarItem.title = "TvShow"
//		tvShowNavController.tabBarItem.image = nil
		
		
		
		viewControllers = [
			generateNavigationController(with: MusicSearchController(), title: "Music", image: #imageLiteral(resourceName: "favorites")),
			generateNavigationController(with: MovieSearchController() , title: "Film", image: #imageLiteral(resourceName: "search")),
			generateNavigationController(with: TvShowSearchController(), title: "TV Show", image: #imageLiteral(resourceName: "downloads"))
		]
		
	}
	
	fileprivate func generateNavigationController(with rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
		
		let navController = UINavigationController(rootViewController: rootViewController)
		rootViewController.navigationItem.title = title
		navController.tabBarItem.title = title
		navController.tabBarItem.image = image
		return navController
		
	}
	
	
}
