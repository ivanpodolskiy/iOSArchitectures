//
//  AppDeatilScreenshotViewCell.swift
//  iOSArchitecturesDemo
//
//  Created by user on 03.05.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

class AppDeatilScreenshotViewCell: UICollectionViewCell {
    
    static let reuseID = "AppDeatilScreenshotViewCell"
 
    private(set) lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addImageView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 10
        
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addImageView() {
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.widthAnchor.constraint(equalTo: widthAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor),
            imageView.leftAnchor.constraint(equalTo: leftAnchor)])
    }
}


