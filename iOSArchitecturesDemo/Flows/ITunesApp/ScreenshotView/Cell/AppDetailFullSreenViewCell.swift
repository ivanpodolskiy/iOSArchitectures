//
//  AppDetailFullSreenViewCell.swift
//  iOSArchitecturesDemo
//
//  Created by user on 18.05.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

class ScreenshotViewCell: UICollectionViewCell {
    
    static let reuseID = "AppDetailFullSreenViewCell"
    
    private(set) lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
   
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.maximumZoomScale = 1.0
        scrollView.minimumZoomScale = 3.5
        scrollView.backgroundColor = .brown
        return scrollView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        scrollView.delegate = self
        addSubview(scrollView)
        scrollView.addSubview(imageView)
        NSLayoutConstraint.activate([
            
            scrollView.leftAnchor.constraint(equalTo: leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: rightAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            imageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            imageView.leftAnchor.constraint(equalTo: scrollView.leftAnchor)
        ])
    }
  
}

extension ScreenshotViewCell: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
