//
//  PhotoTableViewController.swift
//  UserDefaultDemo
//
//  Created by Eddril Lacorte on 8/11/20.
//  Copyright © 2020 EL. All rights reserved.
//

import UIKit
var photo : Photo!

class PhotoTableViewController: UITableViewController, UISearchBarDelegate {
    
    let photos = readData()
    
    //search module - add UISearchController
    let searchController = UISearchController(searchResultsController: nil)
    //search module - list array (var)
    var filteredData = [Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigation title with user's name
        //let name = UserDefaults.standard.string(forKey: "name")
        //title = "\(name.unsafelyUnwrapped)'s Toys & Toonz"
        title = "Toys & Toonz"
        
        // Transparent navigationBar
        //self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        //search module
        searchController.searchResultsUpdater = self
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PhotoTableViewCell
        
        //search module - photo data or filtered data cell
        let photo = searchController.isActive ? filteredData[indexPath.row] : photos[indexPath.row]
        
        //capture title, date, image
        cell.titleLabel.text = photo.title
        cell.PhotoImageView.image = photo.pic
        cell.dateLabel.text = photo.date
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //search module
        return searchController.isActive ? filteredData.count : photos.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        photo = photos[indexPath.row]
        performSegue(withIdentifier: "showPhoto", sender: self)
    }
    
    //search module
    func filterSearchController(_ searchBar: UISearchBar) {
        let searchText = searchBar.text ?? ""
        
        filteredData = photos.filter { photo in
            let isMatchingSearchText = photo.title.lowercased().contains(searchText.lowercased()) || searchText.lowercased().count == 0
            return isMatchingSearchText
        }
        //print(filteredData)
        tableView.reloadData()
    }
    
}

//search module
extension PhotoTableViewController : UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterSearchController(searchController.searchBar)
    }
    
}
