//
//  HomeViewModel.swift
//  GihubRepositoriesDafleCardoso
//
//  Created by Dafle Cardoso on 16/05/20.
//  Copyright © 2020 Dafle Cardoso. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel: BaseViewModel {
    
    private let githubService: GithubServiceContract
    
    private let _issues = PublishSubject<[GithubIssue]>()
    var issues: Driver<[GithubIssue]> {
        return self._issues.asDriver(onErrorJustReturn: [])
    }
    
    init(githubService: GithubServiceContract) {
        self.githubService = githubService
    }
    
    func fetch() {
        self.githubService
            .issues()
            .defaultLoading(super.isLoading)
            .subscribe(onSuccess: { issues in
                self._issues.onNext(issues)
            }, onError: handleError(error:))
            .disposed(by: disposeBag)
    }
}
