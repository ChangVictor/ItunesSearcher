//
//  Movie.swift
//  ItunesSearcher
//
//  Created by Victor Chang on 17/08/2018.
//  Copyright © 2018 Victor Chang. All rights reserved.
//

import Foundation

struct Movie: Decodable {
	
	private var trackName: String?
	private var artistName: String?
	private var artworkUrl100: String?
	private var longDescription: String?
	private var previewUrl: String?
	
	init(dictionary: [String: AnyObject]) {
		self.trackName = dictionary["trackName"] as? String ?? "noTrackName"
		self.artistName = dictionary["artistName"] as? String ?? "noArtistName"
		self.artworkUrl100 = dictionary["artworkUrl100"] as? String ?? "noArtwork"
		self.longDescription = dictionary["longDescription"] as? String ?? "noDescription"
		self.previewUrl = dictionary["previewUrl"] as? String ?? "noPreview"
	}
	
	func getTrackName() -> String{
		return trackName ?? ""
	}
	
	func getArtistName() -> String {
		return artistName ?? ""
	}
	
	func getArtWork() -> String {
		return artworkUrl100 ?? ""
	}
	
	func getDescription() -> String{
		return longDescription ?? ""
	}
	
	func getPreview() -> String {
		return previewUrl ?? ""
	}
	
}
