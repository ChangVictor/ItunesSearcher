//
//  MovieSearchController.swift
//  ItunesSearcher
//
//  Created by Victor Chang on 20/08/2018.
//  Copyright © 2018 Victor Chang. All rights reserved.
//

import UIKit
import Alamofire

class MovieSearchController: UITableViewController, UISearchBarDelegate {
	
	var movieResults = [Movie]()
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
		
		APIService.shared.fetchFilms(searchText: searchText) { (films) in
			self.movieResults = films
			self.tableView.reloadData()
		}
		
	}
	
	fileprivate func setupTableView() {
		let nib = UINib(nibName: "MediaViewCell", bundle: nil)
		tableView.register(nib, forCellReuseIdentifier: cellId)
		tableView.tableFooterView = UIView()
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return movieResults.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! MediaViewCell
		let movie = self.movieResults[indexPath.row]
		cell.movie = movie
		return cell
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 200
	}
	
	override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let label = UILabel()
		label.text = "Search for Movies ..."
		label.textAlignment = .center
		label.textColor = .darkGray
		label.font = UIFont.systemFont(ofSize:20, weight: .semibold)
		return label
	}
	
	override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return self.movieResults.count == 0 ? 250 : 0
	}
	
}

