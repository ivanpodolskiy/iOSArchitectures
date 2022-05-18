//
//  SongCall.swift
//  iOSArchitecturesDemo
//
//  Created by user on 29.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation
import UIKit
class SongCall: UITableViewCell {
    // MARK: - Subviews

    
    
    private(set) lazy var imageSong: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    private(set) lazy var titleLable: UILabel  = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        return label
    }()
    
    private(set) lazy var artistLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 13.0)
        return label
    }()
    
    private(set) lazy var albumLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12.0)
        return label
    }()
    
    func configure(with song: SongCellModel) {
        self.titleLable.text = song.song
        self.artistLabel.text = song.artist
        self.albumLabel.text = song.album
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureUI()
    }
    
    //MARK: - UI
    
    private func configureUI(){
        self.addImageSong()
        self.addTitleLabel()
        self.addArtistLabel()
        self.addAlbumLabel()
    }
    func addImageSong() {
        self.contentView.addSubview(imageSong)
        NSLayoutConstraint.activate([
            imageSong.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            imageSong.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            imageSong.widthAnchor.constraint(equalToConstant: 55.0),
            imageSong.heightAnchor.constraint(equalToConstant: 55.0)
        ])
    }
    
    func addTitleLabel() {
        self.contentView.addSubview(titleLable)
        
        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            titleLable.leftAnchor.constraint(equalTo: self.imageSong.rightAnchor, constant: 8),
            titleLable.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
        ])
    }
    
    
    func addArtistLabel() {
        self.contentView.addSubview(artistLabel)
        NSLayoutConstraint.activate([
            artistLabel.topAnchor.constraint(equalTo: self.titleLable.bottomAnchor, constant: 4),
            artistLabel.leftAnchor.constraint(equalTo: self.titleLable.leftAnchor),
            artistLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
        ])
    }
    
    func addAlbumLabel(){
        self.contentView.addSubview(albumLabel)
        NSLayoutConstraint.activate([
            albumLabel.topAnchor.constraint(equalTo: self.artistLabel.bottomAnchor, constant: 4),
            albumLabel.leftAnchor.constraint(equalTo: self.titleLable.leftAnchor),
            albumLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
        ])
    }
}
