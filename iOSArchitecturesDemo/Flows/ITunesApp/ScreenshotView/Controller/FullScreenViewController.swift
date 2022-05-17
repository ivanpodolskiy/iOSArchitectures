//
//  FullScreenViewController.swift
//  iOSArchitecturesDemo
//
//  Created by user on 11.05.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation
import UIKit

class ScreenshotViewController: UIViewController {
    
    private let imageDownloader = ImageDownloader()
    private let app: ITunesApp
    private let indexPath: IndexPath
    init(indexPath: IndexPath, app: ITunesApp) {
        self.indexPath = indexPath
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let viewCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        var  collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.contentInsetAdjustmentBehavior = .never
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = viewCollection

        viewCollection.delegate = self
        viewCollection.dataSource = self
        viewCollection.register(ScreenshotViewCell.self, forCellWithReuseIdentifier: ScreenshotViewCell.reuseID)
    }
}

extension ScreenshotViewController: UICollectionViewDelegate {
    
}

extension ScreenshotViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return app.screenshotUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dequeuedCell = collectionView.dequeueReusableCell(withReuseIdentifier: ScreenshotViewCell.reuseID, for: indexPath)
        guard let cell = dequeuedCell as? ScreenshotViewCell else { return dequeuedCell }
        
        let image = app.screenshotUrls[indexPath.row]
        imageDownloader.getImage(fromUrl: image) { image, error in
            cell.imageView.image = image
        }
        return cell
    }
}

extension ScreenshotViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthCell = collectionView.bounds.width
        let heightCell = collectionView.bounds.height
        return CGSize(width: widthCell, height: heightCell)
    }
}
