//
//  SearchViewController.swift
//  AudioCloud
//
//  Created by Subash Luitel on 3/16/17.
//  Copyright © 2017 Luitel Inc. All rights reserved.
//

import UIKit
import Parse
import SDWebImage

class SearchViewController: UITableViewController, UISearchBarDelegate {
    
    var objects = [PFObject]()
    var searchBar = UISearchBar()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addSearchBar()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchCell
        let object = objects[indexPath.row]
        if let coverLink = (object.object(forKey: "cover") as? PFFile)?.url {
            if let coverURL = URL(string: coverLink) {
                cell.coverArtThumbnailView.sd_setImage(with: coverURL)
            }
        }
        cell.titleLabel.text = object.object(forKey: "title") as? String
        
        return cell
    }
    

    func searchFiles(searchTerm: String) {
        let keywordQuery = PFQuery(className: "Audio")
        keywordQuery.whereKey("searchItems", equalTo: searchTerm)
        
        let titleQuery = PFQuery(className: "Audio")
        titleQuery.whereKey("title", hasPrefix: searchTerm)
        
        let query = PFQuery.orQuery(withSubqueries: [keywordQuery, titleQuery])
        query.includeKey("user")
        query.findObjectsInBackground { (objects, error) in
            if let theObjects = objects {
                self.objects = theObjects
                self.tableView.reloadData()
            }
        }
        
    }
    
    private func addSearchBar() {
        navigationItem.titleView = searchBar
        searchBar.showsCancelButton = true
        searchBar.delegate = self
        searchBar.autocapitalizationType = UITextAutocapitalizationType.none
        searchBar.autocorrectionType = UITextAutocorrectionType.no
        searchBar.placeholder = "Search music"
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchTerm = searchBar.text {
            searchFiles(searchTerm: searchTerm)
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchFiles(searchTerm: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    
    
    
}
