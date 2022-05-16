//
//  AppCell.swift
//  iOSArchitecturesDemo
//
//  Created by Evgeny Kireev on 01/03/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

 class Icon {
    static let notDownloadedIcon = "arrow.down.to.line.circle.fill"
    static let downloaded = "chevron.down.circle"
}

final class AppCell: UITableViewCell {

    // MARK: - Subviews
    private(set) lazy var indicatorDownload: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 13.0)
        return label
    }()
    
    private(set) lazy var downloadIcon: UIImageView = {
        let imageView = UIImageView()
        if #available(iOS 13.0, *) {
            imageView.image = UIImage(systemName: Icon.notDownloadedIcon )
        }
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Тест"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        return label
    }()
    
    private(set) lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 13.0)
        return label
    }()
    
    private(set) lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12.0)
        return label
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    // MARK: - UI
    override func prepareForReuse() {
        [self.titleLabel, self.subtitleLabel, self.ratingLabel, self.indicatorDownload].forEach { $0.text = nil }
    }
    
    private func configureUI() {
        self.addIconDownolad()
        self.addTitleLabel()
        self.addSubtitleLabel()
        self.addRatingLabel()
        self.addIndicatorDownload()
    }
    
    private func addIconDownolad() {
        self.contentView.addSubview(self.downloadIcon)
        NSLayoutConstraint.activate([
            self.downloadIcon.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            self.downloadIcon.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -30.0),
            self.downloadIcon.widthAnchor.constraint(equalToConstant: 40.0),
            self.downloadIcon.heightAnchor.constraint(equalToConstant: 40.0),])
    }
    
    private func addTitleLabel() {
        self.contentView.addSubview(self.titleLabel)
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            self.titleLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.titleLabel.rightAnchor.constraint(equalTo: self.downloadIcon.leftAnchor, constant: -12)
        ])
    }
    
    private func addSubtitleLabel() {
        self.contentView.addSubview(self.subtitleLabel)
        NSLayoutConstraint.activate([
            self.subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 4.0),
            self.subtitleLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.subtitleLabel.rightAnchor.constraint(equalTo: self.downloadIcon.leftAnchor, constant: -12.0)
        ])
    }
    
    private func addRatingLabel() {
        self.contentView.addSubview(self.ratingLabel)
        NSLayoutConstraint.activate([
            self.ratingLabel.topAnchor.constraint(equalTo: self.subtitleLabel.bottomAnchor, constant: 4.0),
            self.ratingLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.ratingLabel.rightAnchor.constraint(equalTo: self.downloadIcon.leftAnchor, constant: -30.0)
        ])
    }

    private func addIndicatorDownload() {
        self.contentView.addSubview(self.indicatorDownload)
        NSLayoutConstraint.activate([
            self.indicatorDownload.widthAnchor.constraint(equalToConstant: 100),
            self.indicatorDownload.topAnchor.constraint(equalTo: self.ratingLabel.topAnchor),
            self.indicatorDownload.leftAnchor.constraint(equalTo: self.ratingLabel.rightAnchor, constant: 8.0),
            self.indicatorDownload.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -8.0)])
    }
}
