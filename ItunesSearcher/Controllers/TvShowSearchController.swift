//
//  TvShowSearchController.swift
//  ItunesSearcher
//
//  Created by Victor Chang on 20/08/2018.
//  Copyright © 2018 Victor Chang. All rights reserved.
//

import UIKit
import Alamofire
import AVKit

class TvShowSearchController: UITableViewController, UISearchBarDelegate {
	
	var tvShowResults = [TvShow]()
	let cellId = "cellId"
	let searchController = UISearchController(searchResultsController: nil)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupSearchBar()
		setupTableView()
		
	}
	
	fileprivate func setupSearchBar() {
		
		navigationItem.searchController = searchController
		navigationItem.hidesSearchBarWhenScrolling = false
		searchController.dimsBackgroundDuringPresentation = false
		searchController.searchBar.delegate = self
		searchController.searchBar.showsCancelButton = false
		definesPresentationContext = true
		
	}
	
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		
		APIService.shared.fetchShows(searchText: searchText) { (shows) in
			self.tvShowResults = shows
			self.tableView.reloadData()
		}
		
	}
	
	fileprivate func setupTableView() {
		
		let nib = UINib(nibName: "MediaViewCell", bundle: nil)
		tableView.register(nib, forCellReuseIdentifier: cellId)
		tableView.tableFooterView = UIView()
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tvShowResults.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MediaViewCell
		let tvShow = self.tvShowResults[indexPath.row]
		cell.tvShow = tvShow
		return cell
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 200
	}
	
	override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let label = UILabel()
		label.text = "Search for TV Shows ..."
		label.textAlignment = .center
		label.textColor = .darkGray
		label.font = UIFont.systemFont(ofSize:20, weight: .semibold)
		return label
	}
	
	override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return self.tvShowResults.count == 0 ? 250 : 0
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		guard let indexPath = tableView.indexPathForSelectedRow else { return }
		guard let currentCell = tableView.cellForRow(at: indexPath) as? MediaViewCell else { return }
		guard let currentItem = currentCell.tvShow?.getPreview() else { return }
		
		let videoURL = NSURL(string: currentItem)
		let player = AVPlayer(url: videoURL! as URL)
		
		let playerViewController = AVPlayerViewController()
		
		playerViewController.player = player
		
		self.present(playerViewController, animated: true) { ()-> Void in
			playerViewController.player!.play()
		}
	}
	
}
