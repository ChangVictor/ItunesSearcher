//
//  Music.swift
//  ItunesSearcher
//
//  Created by Victor Chang on 17/08/2018.
//  Copyright © 2018 Victor Chang. All rights reserved.
//

import Foundation

struct Music: Decodable {
	
	private var trackName: String
	private var artistName: String
	private var artworkUrl100: String
	private var previewUrl: String
	
	init(dictionary: [String: AnyObject]) {
		self.trackName = dictionary["trackName"] as? String ?? ""
		self.artistName = dictionary["artistName"] as? String ?? ""
		self.artworkUrl100 = dictionary["artworkUrl100"] as? String ?? ""
		self.previewUrl = dictionary["previewUrl"] as? String ?? ""
	}
	
	func getTrackName() -> String {
		return trackName
	}
	
	func getArtistName() -> String {
		return artistName
	}
	
	func getArtWork() -> String {
		return artworkUrl100
	}
	
	func getPreview() -> String {
		return previewUrl
	}
	
}
