//
//  AppDetailUpdateViewController.swift
//  iOSArchitecturesDemo
//
//  Created by user on 28.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation
import UIKit

class AppDetailUpdateViewController: UIViewController {
    
    private let app: ITunesApp
    
    private var appDetailUpdateView: AppDetailUpdateView {
        return self.view as! AppDetailUpdateView
    }
    
    //MARK: - Construction

    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = AppDetailUpdateView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillData()
    }
    
 
    //MARK: - private functions
    
    private func changeDateFomart(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    
        let dates = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd.MM.yy"
        let resultDate = dateFormatter.string(from: dates!)
        return resultDate
    }
    
    private func fillData() {
        
        let dateVersion = changeDateFomart(date: app.currentVersionReleaseDate)
        appDetailUpdateView.versionUpdateLabel.text = "Версия \(app.version)"
        appDetailUpdateView.dateUpdateLabel.text = "Дата обновления: \(dateVersion)"
        appDetailUpdateView.descriptionUpdateLabel.text = app.releaseNotes
    }
}
