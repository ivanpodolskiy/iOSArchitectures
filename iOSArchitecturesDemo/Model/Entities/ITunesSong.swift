//
//  ITunesSong.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 19.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

public struct ITunesSong: Codable {
    
    public var trackName: String
    public var artistName: String?
    public var collectionName: String?
    public var artwork: String?
    public var primaryGenreName: String?
    public var releaseDate: String?
    
    // MARK: - Codable
    private enum CodingKeys: String, CodingKey {
        case trackName = "trackName"
        case artistName = "artistName"
        case collectionName = "collectionName"
        case artwork = "artworkUrl100"
        case primaryGenreName = "primaryGenreName"
        case releaseDate = "releaseDate"
    }
    
    // MARK: - Init
    
    internal init(trackName: String,
                  artistName: String?,
                  collectionName: String?,
                  artwork: String?,
                  primaryGenreName: String?,
                  releaseDate: String?) {
        self.trackName = trackName
        self.artistName = artistName
        self.collectionName = collectionName
        self.artwork = artwork
        self.primaryGenreName = primaryGenreName
        self.releaseDate = releaseDate
    }
}
