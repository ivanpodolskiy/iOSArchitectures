//
//  SearchModulBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by user on 27.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation
import UIKit

class SearchModulBuilder{
    static func biuld() -> (UIViewController & SearchViewInput) {
        
        let searchService = ITunesSearchService()
        let downloadAppService =  FakeDownloadAppsService()
        let viewModel = SearchViewModel(searchService: searchService, downloadAppsService: downloadAppService)
        let viewController = SearchViewController(viewModel: viewModel)
        viewModel.viewController = viewController
//        let presenter = SearchPresenter()
//        let viewController = SearchViewController(presetner: presenter)
//        presenter.viewInput = viewController
        return viewController
    }
}

class SearchSongModulBuilder {
    static func build() -> (UIViewController & SearchSongViewInput) {
        let interactor = InteractorSearchSong()
        let router = RouterSearchSong()
        let presenter = SearchSongPresenter(interactor: interactor, router: router)
        let viewController = SearchSongsViewController(presenter: presenter)
        router.viewController = viewController
        presenter.inputViewController = viewController
        return viewController
    }
}
