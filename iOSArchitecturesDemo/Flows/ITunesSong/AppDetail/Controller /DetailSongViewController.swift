//
//  DetailSongViewController.swift
//  iOSArchitecturesDemo
//
//  Created by user on 03.05.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation
import UIKit

class DetailSongViewController: UIViewController {
    
    private let song: ITunesSong
    
    private let imageDownloader =  ImageDownloader()
   
    private var detailView: SongDetailView {
        return self.view as! SongDetailView
    }
    
    init(song: ITunesSong) {
        self.song = song
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        super.loadView()
        self.view = SongDetailView()
        configureUI()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
    }
    

    private func configureUI(){
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .white
        navigationItem.largeTitleDisplayMode = .never
  
    }
    private func fillData() {
  
        guard let date = song.releaseDate else {
            return
        }
        downloadImage()
        let releaseDate = DateFormatter.changeDateFomart(date: date)
        detailView.releaseDateLabel.text = "Дата резила: \(releaseDate)"
        detailView.titleArtistLabel.text = song.artistName
        detailView.nameAlbumLabel.text = song.collectionName
        detailView.nameSongLabel.text = song.trackName
        
        detailView.genreNameLabel.text = song.primaryGenreName
        
        print ("Информация о песни: Артист - \(song.artistName), Альбом - \(song.collectionName),  Название песни - \(song.trackName), Дата релиза: \(releaseDate), Жанр: \(song.primaryGenreName)")
    }
    
    private func downloadImage() {
        guard let url = song.artwork else { return }
        imageDownloader.getImage(fromUrl: url) { [weak self] (image, _) in
            self?.detailView.imageView.image = image
        }
    }
}
