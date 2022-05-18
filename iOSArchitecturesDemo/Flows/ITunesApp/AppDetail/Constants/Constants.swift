//
//  File.swift
//  iOSArchitecturesDemo
//
//  Created by user on 09.05.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    static let leftDistanceToView: CGFloat = 20
    static let rightDistanceToView: CGFloat = 20
    static let screenshotMinimumLineSpacing: CGFloat = 10
    static let screenshotItemWidth = (UIScreen.main.bounds.width - Constants.leftDistanceToView - Constants.rightDistanceToView - (Constants.screenshotMinimumLineSpacing / 1.5)) / 1.5
}
