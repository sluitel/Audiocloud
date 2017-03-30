//
//  Song.swift
//  AudioCloud
//
//  Created by Subash Luitel on 3/29/17.
//  Copyright © 2017 Luitel Inc. All rights reserved.
//

import UIKit

class Song: NSObject {
    
    var songTitle: String?
    var caption: String?
    var coverArtURL: URL?
    var fileURL: URL?
    
    init(data: [String : Any]?) {
        songTitle = data?["title"] as? String
        caption = data?["description"] as? String
        if let coverLink = data?["coverArt"] as? String {
            coverArtURL = URL(string: coverLink)
        }
        if let fileLink = data?["song"] as? String {
            fileURL = URL(string: fileLink)
        }
    }
}
