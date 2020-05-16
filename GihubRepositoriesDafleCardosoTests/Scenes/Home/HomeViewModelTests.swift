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
    
    func test_fetch_issues_success() {
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
    
    func test_fetch_and_receive_empty_data() {
        let viewModel = HomeViewModel(githubService: GithubServiceMock(with: .empty))
        
        var issues: [GithubIssue]!
        
        viewModel.issues.drive(onNext: { _issues in
            issues = _issues
        }).disposed(by: disposeBag)
        
        viewModel.fetch()
        
        XCTAssertEqual(issues.count, 0)
    }
    
    func test_fetch_issues_and_receive_error() {
        let viewModel = HomeViewModel(githubService: GithubServiceMock(with: .error))
        var issues: [GithubIssue]!
        
        viewModel.issues.asObservable().subscribe(onNext: { _issues in
            issues = _issues
        }).disposed(by: disposeBag)
        
        viewModel.fetch()
        
        XCTAssertNil(issues)
    }
    
    func test_fetch_issues_with_json_file() {
        let mockService = GithubServiceMock(with: .successWith(jsonFile: "mock_issues_response_success"))
        let viewModel = HomeViewModel(githubService: mockService)
        
        var issues: [GithubIssue]!
        
        viewModel.issues.drive(onNext: { _issues in
            issues = _issues
        }).disposed(by: disposeBag)
        
        viewModel.fetch()
        
        XCTAssertEqual(issues.count, 1)
        let issue = issues.first!
        XCTAssertEqual(issue.id, 619381830)
        XCTAssertEqual(issue.number, 31838)
        XCTAssertEqual(issue.title, "[NFC] AST: Optimize GenericSignatureImpl::getInnermostGenericParams")
        XCTAssertEqual(issue.body, "Adding a fast path that enables us to simplify the successive loop.\r\n\r\nJudging by the abundance of `BoundGenericType::getGenericArgs` usage, we are going to have to call `GenericSignatureImpl::getInnermostGenericParams` much more often once we start storing substitution maps in bound generic type nodes, so this is ensuring the latter is as fast as possible without caching.\r\n")
        XCTAssertEqual(issue.user.avatarUrl,
                       "https://avatars3.githubusercontent.com/u/17835512?v=4")
        XCTAssertEqual(issue.state, .open)
    }
}
