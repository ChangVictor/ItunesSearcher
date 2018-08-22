//
//  APIService.swift
//  ItunesSearcher
//
//  Created by Victor Chang on 20/08/2018.
//  Copyright © 2018 Victor Chang. All rights reserved.
//

import Foundation
import Alamofire

class APIService {
	
	let baseItunesSearchUrl = "https://itunes.apple.com/search"

	//Singleton
	static let shared = APIService()
	
	func fetchSongs(searchText: String, completionHandler: @escaping ([Music]) -> ()) {
		print("Searching for songs...")
		
		let parameters = ["term": searchText, "media": "music"]
		Alamofire.request(baseItunesSearchUrl , method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
			
			if let error = dataResponse.error {
				print("Failed to contact webserver", error)
				return
			}
			
			guard let data = dataResponse.data else { return }
			do {
				
				let searchResult = try JSONDecoder().decode(MusicResult.self, from: data)
				print(searchResult.resultCount)
				completionHandler(searchResult.results)

			} catch let decodeError {
				print("Fialed to decode: ", decodeError)
			}
		}
		
	}
	
	func fetchFilms(searchText: String, completionHandler: @escaping ([Movie]) -> ()) {
		print("Searching for songs...")
		
		let parameters = ["term": searchText, "media": "movie"]
		Alamofire.request(baseItunesSearchUrl , method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
			
			if let error = dataResponse.error {
				print("Failed to contact webserver", error)
				return
			}
			
			guard let data = dataResponse.data else { return }
			do {
				
				let searchResult = try JSONDecoder().decode(MovieResult.self, from: data)
				print(searchResult.resultCount)
				completionHandler(searchResult.results)
				
			} catch let decodeError {
				print("Fialed to decode: ", decodeError)
			}
		}
		
	}
	
	func fetchShows(searchText: String, completionHandler: @escaping ([TvShow]) -> ()) {
		print("Searching for songs...")
		
		let parameters = ["term": searchText, "media": "tvShow"]
		Alamofire.request(baseItunesSearchUrl , method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
			
			if let error = dataResponse.error {
				print("Failed to contact webserver", error)
				return
			}
			
			guard let data = dataResponse.data else { return }
			do {
				
				let searchResult = try JSONDecoder().decode(TvShowResult.self, from: data)
				print(searchResult.resultCount)
				completionHandler(searchResult.results)
				
			} catch let decodeError {
				print("Fialed to decode: ", decodeError)
			}
		}
		
	}

	struct MusicResult: Decodable {
		let resultCount: Int
		let results: [Music]
	}
	
	struct MovieResult: Decodable {
		let resultCount: Int
		let results: [Movie]
	}
	
	struct TvShowResult: Decodable {
		let resultCount: Int
		let results: [TvShow]
	}
	
}
