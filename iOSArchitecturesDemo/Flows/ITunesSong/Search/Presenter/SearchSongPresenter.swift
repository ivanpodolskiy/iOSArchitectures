//
//  SearchSongPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by user on 01.05.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation
import UIKit

protocol SearchSongViewInput: class {
    var searchResults: [ITunesSong] { get set}
    func showError(error: Error)
    func hideNoResults()
    func shwoNoResilts()
    func throbber(show: Bool)
}

protocol SearchSongViewOutput: class {
    func viewDidSearch(with query: String)
}

class SearchSongPresenter {
    weak var inputViewController: (UIViewController & SearchSongViewInput)?
    private let searchService = ITunesSearchService()
    
    private func requestSong(with query: String) {
        self.searchService.getSongs(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            self.inputViewController?.throbber(show: false)
            result.withValue { songs in
                guard !songs.isEmpty else {
                    self.inputViewController?.searchResults = []
                    self.inputViewController?.shwoNoResilts()
                    return
                }
                self.inputViewController?.hideNoResults()
                self.inputViewController?.searchResults = songs
            }
            .withError{
                self.inputViewController?.showError(error: $0)
            }
        }
    }
}
extension SearchSongPresenter: SearchSongViewOutput{
    func viewDidSearch(with query: String) {
        inputViewController?.throbber(show: true)
        requestSong(with: query)
    }
}
