//
//  SearchCell.swift
//  AudioCloud
//
//  Created by Subash Luitel on 3/16/17.
//  Copyright © 2017 Luitel Inc. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {
    
    @IBOutlet weak var coverArtThumbnailView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    

    override func layoutSubviews() {
        super.layoutSubviews()
        coverArtThumbnailView.layer.cornerRadius = coverArtThumbnailView.frame.width / 2
        coverArtThumbnailView.layer.masksToBounds = true
    }

}
