//
//  SearchModulBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by user on 27.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation
import UIKit

class SearchModulBuilder{
    static func biuld() -> (UIViewController & SearchViewInput) {
        let presenter = SearchPresenter()
        let viewController = SearchViewController(presetner: presenter)
        presenter.viewInput = viewController
        return viewController
    }
}