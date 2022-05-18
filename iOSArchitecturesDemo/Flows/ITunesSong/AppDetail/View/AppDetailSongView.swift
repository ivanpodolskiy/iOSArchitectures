//
//  AppDetailSongView.swift
//  iOSArchitecturesDemo
//
//  Created by user on 03.05.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation
import UIKit

class SongDetailView: UIView {
    
    private(set) lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 30.0
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private(set) lazy var titleArtistLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemRed
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 2
        return label
    }()
    
    private(set) lazy var nameSongLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        return label
    }()
    
    private(set) lazy var nameAlbumLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        return label
    }()
    
    private(set) lazy var genreNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        return label
    }()
    public var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
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
    
    private func setupLayout() {
        addSubview(imageView)
        addSubview(titleArtistLabel)
        addSubview(nameSongLabel)
        addSubview(nameAlbumLabel)
        addSubview(genreNameLabel)
        addSubview(releaseDateLabel)
        NSLayoutConstraint.activate([
            
            
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16.0),
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0),
            imageView.widthAnchor.constraint(equalToConstant: 120),
            imageView.heightAnchor.constraint(equalToConstant: 120),
        
            nameSongLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16.0),
            nameSongLabel.leftAnchor.constraint(equalTo: self.imageView.rightAnchor, constant: 16.0),
            nameSongLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16.0),

            titleArtistLabel.topAnchor.constraint(equalTo: nameSongLabel.bottomAnchor, constant: 5.0),
            titleArtistLabel.leftAnchor.constraint(equalTo: nameSongLabel.leftAnchor),
            titleArtistLabel.rightAnchor.constraint(equalTo: nameSongLabel.rightAnchor),

            nameAlbumLabel.topAnchor.constraint(equalTo: titleArtistLabel.bottomAnchor, constant: 5.0),
            nameAlbumLabel.leftAnchor.constraint(equalTo: titleArtistLabel.leftAnchor),
            nameAlbumLabel.rightAnchor.constraint(equalTo: titleArtistLabel.rightAnchor),

            genreNameLabel.topAnchor.constraint(equalTo: nameAlbumLabel.bottomAnchor, constant: 5.0),
            genreNameLabel.leftAnchor.constraint(equalTo: titleArtistLabel.leftAnchor),
            genreNameLabel.rightAnchor.constraint(equalTo: titleArtistLabel.rightAnchor),

            releaseDateLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16.0),
            releaseDateLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor),
            releaseDateLabel.widthAnchor.constraint(equalToConstant: 300)
//            releaseDateLabel.rightAnchor.constraint(equalTo: imageView.rightAnchor)
        ])
    }
}
