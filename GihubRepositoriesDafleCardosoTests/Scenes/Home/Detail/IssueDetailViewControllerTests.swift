//
//  IssueDetailViewControllerTests.swift
//  GihubRepositoriesDafleCardosoTests
//
//  Created by Dafle Cardoso on 16/05/20.
//  Copyright © 2020 Dafle Cardoso. All rights reserved.
//

import XCTest
@testable import GihubRepositoriesDafleCardoso

class IssueDetailViewControllerTests: XCTestCase {

    func test_view_attributes_data() {
        let date = Date()
        let user = GithubUser(avatarUrl: "https://user-image.com")
        let issue = GithubIssue(id: 1,
                                number: 2,
                                title: "title",
                                body: "body",
                                createdAt: date,
                                user: user,
                                state: .open)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy 'às' HH:mm:ss"
        let viewModel = IssueDetailViewModel(issue: issue)
        let viewController = IssueDetailViewController(viewModel: viewModel)
        UIApplication.shared
            .windows
            .filter {$0.isKeyWindow}
            .first?
            .rootViewController = viewController
        XCTAssertEqual(viewController.issueTitleLabel.text, "title")
        XCTAssertEqual(viewController.issueDescriptionLabel.text, "body")
        XCTAssertEqual(viewController.issueDateLabel.text,
                       dateFormatter.string(from: date))
    }
}
