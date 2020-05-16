//
//  GithubIssueTests.swift
//  GihubRepositoriesDafleCardosoTests
//
//  Created by Dafle Cardoso on 16/05/20.
//  Copyright © 2020 Dafle Cardoso. All rights reserved.
//

import XCTest
@testable import GihubRepositoriesDafleCardoso

class GithubIssueTests: XCTestCase {

    func test_methods_data_object_and_helpers() {
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
        
        XCTAssertEqual(issue.issueURL, "https://github.com/apple/swift/pull/2")
        XCTAssertEqual(issue.dateFormatted, dateFormatter.string(from: date))
    }
    
    func test_issue_description_opened() {
        let user = GithubUser(avatarUrl: "https://user-image.com")
        let issue = GithubIssue(id: 1,
                                number: 2,
                                title: "title",
                                body: "body",
                                createdAt: Date(),
                                user: user,
                                state: .open)
        XCTAssertEqual(issue.state.description, "ABERTO")
    }
    
    func test_issue_description_closed() {
        let user = GithubUser(avatarUrl: "https://user-image.com")
        let issue = GithubIssue(id: 1,
                                number: 2,
                                title: "title",
                                body: "body",
                                createdAt: Date(),
                                user: user,
                                state: .close)
        XCTAssertEqual(issue.state.description, "FECHADO")
    }
}
