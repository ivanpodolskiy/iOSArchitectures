//
//  FullScreenViewController.swift
//  iOSArchitecturesDemo
//
//  Created by user on 11.05.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation
import UIKit

class FullScreenViewController: UIViewController {
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
        var   collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = Constants.screenshotMinimumLineSpacing
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewCollection.delegate = self
        viewCollection.dataSource = self
        view = viewCollection
        viewCollection.register(AppDeatilScreenshotViewCell.self, forCellWithReuseIdentifier: AppDeatilScreenshotViewCell.reuseID)
        print ("Внутри")
    }

}
extension FullScreenViewController: UICollectionViewDelegate {
    
}

extension FullScreenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return app.screenshotUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dequeuedCell = collectionView.dequeueReusableCell(withReuseIdentifier:AppDeatilScreenshotViewCell.reuseID, for: indexPath)
        guard let cell = dequeuedCell as? AppDeatilScreenshotViewCell else { return dequeuedCell }
        let image = app.screenshotUrls[indexPath.row]
        imageDownloader.getImage(fromUrl: image) { image, error in
            cell.imageView.image = image
        }
        return cell
    }
}

extension FullScreenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
