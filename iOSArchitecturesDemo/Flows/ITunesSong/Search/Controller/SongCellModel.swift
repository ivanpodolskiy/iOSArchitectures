//
//  SongCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by user on 30.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation
import UIKit

struct SongCellModel {
    var song: String
    var artist: String?
    var album: String?
}

final class SongCellModelFactory {
    static func getCellModel(with model: ITunesSong) -> SongCellModel {
         return SongCellModel(song: model.trackName, artist: model.artistName, album: model.collectionName)
     }
}
