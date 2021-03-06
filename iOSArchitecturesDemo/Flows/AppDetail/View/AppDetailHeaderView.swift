//
//  AppDetailHeaderView.swift
//  iOSArchitecturesDemo
//
//  Created by user on 23.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation
import UIKit

class AppDetailHeaderView: UIView {
    private(set) lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 30.0
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 2
        return label
    }()
    
    private(set) lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    private(set) lazy var openButton: UIButton = {
        let button  = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Открыть", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        button.layer.cornerRadius = 16.0
        return button
    }()
    
    private(set) lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        return label
    }()
    
    //MARK: - Construction
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI
    private func setupLayout() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(openButton)
        addSubview(ratingLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12.0),
            imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16.0),
            imageView.widthAnchor.constraint(equalToConstant: 120.0),
            imageView.heightAnchor.constraint(equalToConstant: 120.0),
            
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12.0),
            titleLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 16.0),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16.0),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12.0),
            subtitleLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            subtitleLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor),
            
            openButton.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 16.0),
            openButton.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
            openButton.widthAnchor.constraint(equalToConstant: 80.0),
            openButton.heightAnchor.constraint(equalToConstant: 32.0),

            ratingLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24.0),
            ratingLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor),
            ratingLabel.widthAnchor.constraint(equalToConstant: 100.0),
            ratingLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
