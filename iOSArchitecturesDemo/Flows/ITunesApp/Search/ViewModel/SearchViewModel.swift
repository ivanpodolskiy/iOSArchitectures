//
//  SearchViewModel.swift
//  iOSArchitecturesDemo
//
//  Created by user on 13.05.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation
import UIKit

struct SearchAppCellModel {
    let appName: String
    let company: String?
    let averageRating: Float?
    let downloadState: DownloadingApp.DownloadState
}
 
class SearchViewModel {
    
    //MARK: -Observer properties
    let cellModels = Observable<[SearchAppCellModel]>([])
    let isLoading = Observable<Bool>(false)
    let showEmptyResults = Observable<Bool>(false)
    let error = Observable<Error?>(nil)

    //MARK: Properties
    weak var viewController: UIViewController?
    
    private var apps: [ITunesApp] = []
    private let searchService: ITunesSearchService
    private let downloadAppsService: DownloadAppsServiceInterface
    
    //MARK: - Construction
    init(searchService: ITunesSearchService, downloadAppsService: DownloadAppsServiceInterface) {
        self.searchService = searchService
        self.downloadAppsService = downloadAppsService
        
        downloadAppsService.onProgressUpdate = { [weak self] in
            guard let self = self else { return }
            self.cellModels.value = self.viewModels()
        }
    }
    
    //MARK: - ViewModel methods
    func search(for query: String) {
        isLoading.value = true
        
        searchService.getApps(forQuery: query) { [weak self] result in
            guard let self = self else {
                return
            }
            result.withValue{ apps in
                self.apps = apps
                self.cellModels.value = self.viewModels()
                self.isLoading.value = false
                self.showEmptyResults.value = apps.isEmpty
                self.error.value = nil
            }
            .withError {
                self.apps = []
                self.cellModels.value = []
                self.isLoading.value = false
                self.showEmptyResults.value = true
                self.error.value = $0
            }
        }
    }
    
    func didSelectApp(_ appViewModel: SearchAppCellModel) {
        guard let app = self.app(with: appViewModel) else {
            return
        }
        let appDetailViewController = MainAppDetailViewController(app: app)
        self.viewController?.navigationController?.pushViewController(appDetailViewController, animated: true)
        didTapDownloadApp(appViewModel)
    }
    
    func didTapDownloadApp(_ appViewModel: SearchAppCellModel) {
        guard let app = self.app(with: appViewModel) else {
            return
        }
        self.downloadAppsService.startDownloadApps(app)

    }
    
    //MARK: - private functions
    private func viewModels() -> [SearchAppCellModel] {
        return self.apps.compactMap { app -> SearchAppCellModel in
            let donwloadingApp = self.downloadAppsService.downloadingApps.first { downloadingApp -> Bool in
                return downloadingApp.app.appName == app.appName
            }
            return SearchAppCellModel(appName: app.appName,
                                      company: app.company,
                                      averageRating: app.averageRating,
                                      downloadState: donwloadingApp?.downloadState ?? .notStarted )
        }
    }
    
    private func app(with viewModel: SearchAppCellModel) -> ITunesApp? {
        return self.apps.first { viewModel.appName == $0.appName }
    }
}



