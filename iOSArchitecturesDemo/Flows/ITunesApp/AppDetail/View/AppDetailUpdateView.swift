//
//  AppDetailUpdateView.swift
//  iOSArchitecturesDemo
//
//  Created by user on 28.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation
import UIKit

class AppDetailUpdateView: UIView {
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.layer.cornerRadius = 16.0
        label.text = "Что нового"
        return label
    }()
    
    private(set) lazy var historyUpdateButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("История версий", for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    private(set) lazy var versionUpdateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private (set) lazy var dateUpdateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private(set) lazy var descriptionUpdateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
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
        addSubview(titleLabel)
        addSubview(historyUpdateButton)
        addSubview(versionUpdateLabel)
        addSubview(dateUpdateLabel)
        addSubview(descriptionUpdateLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0),
            
            historyUpdateButton.topAnchor.constraint(equalTo: self.titleLabel.topAnchor),
            historyUpdateButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16.0),
            historyUpdateButton.heightAnchor.constraint(equalTo: titleLabel.heightAnchor),
            
            versionUpdateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12.0),
            versionUpdateLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            
            dateUpdateLabel.topAnchor.constraint(equalTo: historyUpdateButton.bottomAnchor, constant: 12.0),
            dateUpdateLabel.rightAnchor.constraint(equalTo: historyUpdateButton.rightAnchor),
            
            descriptionUpdateLabel.topAnchor.constraint(equalTo: versionUpdateLabel.bottomAnchor, constant: 10.0),
            descriptionUpdateLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            descriptionUpdateLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16.0),
            descriptionUpdateLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}
