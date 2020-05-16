//
//  GithubService.swift
//  GihubRepositoriesDafleCardoso
//
//  Created by Dafle Cardoso on 16/05/20.
//  Copyright © 2020 Dafle Cardoso. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol GithubServiceContract {
    func issues() -> Single<[GithubIssue]>
}

class GithubService: GithubServiceContract {
    
    private let provider = ApiProvider<GithubApi>()
    
    func issues() -> Single<[GithubIssue]> {
        return self.provider.rx.request(.issues).mapDefault([GithubIssue].self)
    }
}
