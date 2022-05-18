//
//  InteractorSearchSong.swift
//  iOSArchitecturesDemo
//
//  Created by user on 18.05.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Alamofire

protocol InteractorSearchSongInput {
    func requestSong(with query: String, completion: @escaping (Result<[ITunesSong]>) -> Void)
}

class InteractorSearchSong: InteractorSearchSongInput {
    private let searchService = ITunesSearchService()
    func requestSong(with query: String, completion: @escaping (Result<[ITunesSong]>) -> Void) {
        searchService.getSongs(forQuery: query, completion: completion)
    }
}
