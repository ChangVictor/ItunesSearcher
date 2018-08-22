//
//  TvShow.swift
//  ItunesSearcher
//
//  Created by Victor Chang on 17/08/2018.
//  Copyright © 2018 Victor Chang. All rights reserved.
//

import Foundation

struct TvShow: Decodable {
	
	private var artistName: String
	private var trackName: String
	private var artworkUrl100: String
	private var longDescription: String
	private var previewUrl: String
	
	init(dictionary: [String: AnyObject]) {
		self.artistName = dictionary["artistName"] as? String ?? ""
		self.trackName = dictionary["trackName"] as? String ?? ""
		self.artworkUrl100 = dictionary["artworkUrl100"] as? String ?? ""
		self.longDescription = dictionary["longDescription"] as? String ?? ""
		self.previewUrl = dictionary["previewUrl"] as? String ?? ""
	}
	
	func getArtist() -> String {
		return artistName
	}
	
	func getTrackName() -> String {
		return trackName
	}
	
	func getArtwork() -> String {
		return artworkUrl100
	}
	
	func getDescription() -> String {
		return longDescription
	}
	
	func getPreview() -> String {
		return previewUrl
	}
	
}
