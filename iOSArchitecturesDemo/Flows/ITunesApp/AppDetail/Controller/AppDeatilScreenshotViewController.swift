//
//  AppDeatilScreenshotViewController.swift
//  iOSArchitecturesDemo
//
//  Created by user on 06.05.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

class AppDeatilScreenshotViewController: UIViewController {
    
    private let imageDownloader = ImageDownloader()
    private let app: ITunesApp
  
//    private var image: [UIImage] = []
    //MARK: - Construction
    override func viewDidLoad() {
        super.viewDidLoad()
        viewCollection.dataSource = self
        viewCollection.delegate = self
        view = viewCollection
//        image = getImages()
//        print(image)
        viewCollection.register(AppDeatilScreenshotViewCell.self, forCellWithReuseIdentifier: AppDeatilScreenshotViewCell.reuseID)
        setupConsreaints()
    }
    
    init(app: ITunesApp) {
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
//        collectionView.layer.masksToBounds = true
        layout.minimumLineSpacing = Constants.screenshotMinimumLineSpacing
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    private func setupConsreaints() {
        viewCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        viewCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        viewCollection.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        viewCollection.contentInset = UIEdgeInsets(top: 0, left: Constants.leftDistanceToView, bottom: 0, right: Constants.rightDistanceToView)
    }
    
//    private func getImages() -> [UIImage]{
//        var images: [UIImage] = []
//
//        for i in images {
//            imageDownloader.getImage(fromUrl: i) { image, error in
//                images.append(image)
//            }
//        }
//        return images
//    }
}

extension AppDeatilScreenshotViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return app.screenshotUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dequeuedCell = collectionView.dequeueReusableCell(withReuseIdentifier:AppDeatilScreenshotViewCell.reuseID, for: indexPath)
        guard let cell = dequeuedCell as? AppDeatilScreenshotViewCell else { return dequeuedCell }
        cell.backgroundColor = .black
        let imageUrl =  app.screenshotUrls[indexPath.row]

        imageDownloader.getImage(fromUrl: imageUrl) {image, error in
            cell.imageView.image = image
        }
//        cell.imageView.image = image[indexPath.row]
        return cell
    }
}

extension AppDeatilScreenshotViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = FullScreenViewController(indexPath: indexPath, app: self.app)
        //        appDetaillViewController.app = app
      present(vc, animated: true)
    }
}

extension AppDeatilScreenshotViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.screenshotItemWidth, height: view.frame.height)
    }
}


