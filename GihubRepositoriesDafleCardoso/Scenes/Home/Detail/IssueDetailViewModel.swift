//
//  IssueDetailViewModel.swift
//  GihubRepositoriesDafleCardoso
//
//  Created by Dafle Cardoso on 16/05/20.
//  Copyright © 2020 Dafle Cardoso. All rights reserved.
//

import Foundation

class IssueDetailViewModel: BaseViewModel {
    
    internal let issue: GithubIssue
    
    init(issue: GithubIssue) {
        self.issue = issue
    }
}
