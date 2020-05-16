//
//  AppCoordinator.swift
//  GihubRepositoriesDafleCardoso
//
//  Created by Dafle Cardoso on 16/05/20.
//  Copyright © 2020 Dafle Cardoso. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

class AppCoordinator {
    
    private weak var appDelegate: AppDelegate?
    private let window : UIWindow

    init(appDelegate: AppDelegate, window: UIWindow) {
        self.appDelegate = appDelegate
        self.window = window
    }

    func start() {
        self.navigateToHome()
    }
    
    private func navigateToHome() {
        let githubService = GithubService()
        let viewModel = HomeViewModel(githubService: githubService)
        let viewController = HomeViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
    
    func makeIssueDetailViewController(issue: GithubIssue) -> IssueDetailViewController {
        let viewModel = IssueDetailViewModel(issue: issue)
        return IssueDetailViewController(viewModel: viewModel)
    }
    
    func makeIssueWebViewController(url: URL) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
}
