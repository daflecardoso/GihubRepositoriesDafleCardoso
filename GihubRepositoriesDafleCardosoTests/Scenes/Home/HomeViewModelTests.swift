//
//  HomeViewModelTests.swift
//  GihubRepositoriesDafleCardosoTests
//
//  Created by Dafle Cardoso on 16/05/20.
//  Copyright © 2020 Dafle Cardoso. All rights reserved.
//

import XCTest
import RxSwift
@testable import GihubRepositoriesDafleCardoso

class HomeViewModelTests: XCTestCase {
    
    private let disposeBag = DisposeBag()
    
    func testFetchIssuesSuccess() {
        let viewModel = HomeViewModel(githubService: GithubServiceMock(with: .success))
        
        var issues: [GithubIssue]!
        
        viewModel.issues.drive(onNext: { _issues in
            issues = _issues
        }).disposed(by: disposeBag)
        
        viewModel.fetch()
        
        XCTAssertEqual(issues.count, 2)
        let issue = issues.first!
        XCTAssertEqual(issue.id, 1)
        XCTAssertEqual(issue.number, 1234)
        XCTAssertEqual(issue.title, "Title")
        XCTAssertEqual(issue.body, "Description")
        XCTAssertEqual(issue.user.avatarUrl,
                       "https://avatars3.githubusercontent.com/u/17835512?v=4")
        XCTAssertEqual(issue.state, .open)
    }
    
}
