//
//  ViewCell.swift
//  ItunesSearcher
//
//  Created by Victor Chang on 20/08/2018.
//  Copyright © 2018 Victor Chang. All rights reserved.
//

import UIKit
import SDWebImage
import AVKit

class MediaViewCell: UITableViewCell {
	
	@IBOutlet weak var mediaImageView: UIImageView!
	@IBOutlet weak var trackNameLabel: UILabel!
	@IBOutlet weak var artistNameLabel: UILabel!
	@IBOutlet weak var longDescriptionTextView: UITextView!
	
	var player: AVPlayer?

	
	var song: Music? {
		didSet {
			trackNameLabel.text = song?.getTrackName()
			artistNameLabel.text = song?.getArtistName()
			longDescriptionTextView.text = ""
			guard let url = URL(string: song?.getArtWork() ?? "") else { return }
			mediaImageView.sd_setImage(with: url, completed: nil)
			
			let audio = song?.getPreview()
			let songUrl = URL(string: audio!)
			if let previewUrl = songUrl {
				self.player = AVPlayer(url: previewUrl)
			}

		}
	}
	
	var movie: Movie? {
		didSet {
			trackNameLabel.text = movie?.getTrackName()
//			artistNameLabel.text = movie?.getArtistName()
			artistNameLabel.text = ""
			longDescriptionTextView.text = movie?.getDescription()
			guard let url = URL(string: movie?.getArtWork() ?? "") else { return }
			mediaImageView.sd_setImage(with: url, completed: nil)
			
		}
	}
	
	var tvShow: TvShow? {
		didSet {
			trackNameLabel.text = tvShow?.getTrackName()
			artistNameLabel.text = tvShow?.getArtist()
			longDescriptionTextView.text = tvShow?.getDescription()
			guard let url = URL(string: tvShow?.getArtwork() ?? "") else { return }
			mediaImageView.sd_setImage(with: url, completed: nil)
		}
	}
}
