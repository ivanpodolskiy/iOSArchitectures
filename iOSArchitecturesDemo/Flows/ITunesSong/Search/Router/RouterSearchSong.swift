//
//  RouterSearchSong.swift
//  iOSArchitecturesDemo
//
//  Created by user on 18.05.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

protocol RouterSearchSongInput {
    func openDetailView(for song: ITunesSong)
}

class RouterSearchSong: RouterSearchSongInput {
    weak var viewController: UIViewController?
    
    func openDetailView(for song: ITunesSong) {
        let songDetailViewController = DetailSongViewController(song: song)
        viewController?.navigationController?.pushViewController(songDetailViewController, animated: true)
    }
}
