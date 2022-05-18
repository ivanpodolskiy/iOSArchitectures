//
//  SearchSongsViewController.swift
//  iOSArchitecturesDemo
//
//  Created by user on 29.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation
import UIKit

class SearchSongsViewController: UIViewController {
    // MARK: - Private Properties
    private let presenter: SearchSongViewOutput
    private let imageDownloader = ImageDownloader()
    
    private var searchView: SearchSongsView {
        return self.view as! SearchSongsView
    }
    
    internal  var searchResults = [ITunesSong]() {
        didSet {
            searchView.tableView.isHidden = false
            searchView.tableView.reloadData()
            searchView.tableView.resignFirstResponder()
        }
    }
    
    //MARK: - Construction

    init(presenter: SearchSongViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = SearchSongsView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.searchView.searchBar.delegate = self
        self.searchView.tableView.register(SongCall.self, forCellReuseIdentifier: "reuseIdCell")
        self.searchView.tableView.dataSource = self
        self.searchView.tableView.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.throbber(show: false)
    }

}
//MARK: - UITableViewDataSource
extension SearchSongsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: "reuseIdCell", for: indexPath)
        guard let cell = dequeuedCell as? SongCall else {
            return dequeuedCell
        }
        let item = searchResults[indexPath.row]
        guard let url = item.artwork else {
            return cell
        }
        imageDownloader.getImage(fromUrl: url) { image, error in
            cell.imageSong.image = image
        }
        let cellModel = SongCellModelFactory.getCellModel(with: item)
        cell.configure(with: cellModel)
        return cell
    }
}

extension SearchSongsViewController: UITableViewDelegate {
    
}

//MARK: - UISearchBarDelegate
extension SearchSongsViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else {
            searchBar.resignFirstResponder()
            return
        }
        
        if query.count == 0 {
            searchBar.resignFirstResponder()
            return
        }
        presenter.viewDidSearch(with: query)
    }
}

//MARK: - SearchSongViewInput
extension SearchSongsViewController: SearchSongViewInput {
     func showError(error: Error) {
        let alert = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(actionOk)
        self.present(alert, animated: true, completion: nil)
    }
   
    func throbber(show: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = show
    }
    
   func shwoNoResilts() {
        self.searchView.emptyResultView.isHidden = false
    }
    
    func hideNoResults() {
        self.searchView.emptyResultView.isHidden = true
    }
}
