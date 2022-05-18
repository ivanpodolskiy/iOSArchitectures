//
//  MainAppDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 20.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class MainAppDetailViewController: UIViewController {
    
    lazy var headerViewController = AppDetailHeaderViewController(app: app)
    lazy var updateViewController = AppDetailUpdateViewController(app: app)
    lazy var screenshotViewController = AppDeatilScreenshotViewController(app: app)

    private let app: ITunesApp
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    //MARK: - Construction
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    // MARK: - Private
    private func configureUI(){
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .white
        navigationItem.largeTitleDisplayMode = .never
        
        setupScrollView()
        addHeaderViewController()
        addDescriptionViewController()
        addSreeenshotViewController()
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func addHeaderViewController() {
        addChild(headerViewController)
        scrollView.addSubview(headerViewController.view)
        headerViewController.didMove(toParent: self)
        headerViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerViewController.view.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            headerViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            headerViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }
    
    private func addDescriptionViewController() {
        addChild(updateViewController)
        scrollView.addSubview(updateViewController.view)
        updateViewController.didMove(toParent: self)
        updateViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            updateViewController.view.topAnchor.constraint(equalTo: headerViewController.view.bottomAnchor),
            updateViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            updateViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }
    
    private func addSreeenshotViewController() {
        addChild(screenshotViewController)
        scrollView.addSubview(screenshotViewController.view)
        screenshotViewController.didMove(toParent: self)
        screenshotViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            screenshotViewController.view.topAnchor.constraint(equalTo: updateViewController.view.bottomAnchor, constant: 16),
            screenshotViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            screenshotViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            screenshotViewController.view.heightAnchor.constraint(equalToConstant: 430),
            screenshotViewController.view.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor)
        ])
    }
}
